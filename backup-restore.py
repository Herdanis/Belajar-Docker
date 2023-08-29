import os
import subprocess


def run_command(command):
    result = subprocess.run(
        command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )
    if result.returncode != 0:
        print(f"Error executing command: {result.stderr}")
    else:
        print(result.stdout)


def backup_volume(host_path, container_name, mount, path):
    commands = [
        f"docker container stop {container_name}",
        f'docker container run --rm --name backup \
            --mount "type=bind,source={host_path},destination=/backup" \
            --mount "type=volume,source={mount},destination=/{path}" alpine \
            tar -czvf /backup/backup.tar.gz /{path}',
        f"docker container start {container_name}",
    ]
    for cmd in commands:
        run_command(cmd)


def restore_volume(host_path, mount, path):
    commands = [
        f'docker container run --rm --name ubunturestore \
            --mount "type=bind,source={host_path},destination=/backup" \
            --mount "type=volume,source={mount},destination=/{path}" alpine \
            sh -c "cd /{path} && tar xvf /backup/backup.tar.gz --strip 1"',
    ]
    for cmd in commands:
        run_command(cmd)
    print(f"Volume has been restore to {mount}")


def main():
    action = input("Do you want to 'backup' or 'restore'? ").lower()
    host_path = input("Enter the backup host path: ")
    container_name = input("Enter the container name: ")
    mount = input("Enter the volume name source (for mount): ")
    path = input("Enter the container path source (for path): ")

    if action == "backup":
        backup_volume(host_path, container_name, mount, path)
    elif action == "restore":
        restore_volume(host_path, mount, path)
    else:
        print("Invalid action. Please enter either 'backup' or 'restore'.")


if __name__ == "__main__":
    main()
