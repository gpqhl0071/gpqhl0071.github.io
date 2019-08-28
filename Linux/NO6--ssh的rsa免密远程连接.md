> 使用SSH公钥验证连接到远程系统是使用帐户密码或密码登录的强大，更安全的替代方法。
> SSH公钥认证依赖于非对称加密算法，该算法生成一对单独的密钥（密钥对），一个“私有”，另一个“公共”。
> 您将私钥保密，并将其存储在用于连接远程系统的计算机上。
> 可以想象，您可以与任何人共享公钥而不会泄露私钥; 将它存储在`.ssh /
> authorized_keys`目录中的远程系统上


1. 登录用于访问远程主机的计算机，然后使用命令行SSH使用RSA算法生成密钥对。 
    ```
      ssh-keygen -t rsa
    ```
2. 您的私钥将使用默认文件名（例如，id_rsa）或您指定的文件名（例如，my_ssh_key）生成，并存储在您的计算机上主目录下的.ssh目录中（例如，〜/ .ssh）
/ id_rsa或〜/ .ssh / my_ssh_key）。  

3. 使用SFTP或SCP将公钥文件（例如，〜/ .ssh /
   id_rsa.pub）复制到远程系统上的帐户（例如，darvader@deathstar.empire.gov）;
   例如，使用命令行SCP：  
   ```
   scp ~/.ssh/id_rsa.pub root@192.168.9.214:~/.ssh/
   ```
   系统会提示您输入帐户密码。您的公钥将被复制到远程系统上的主目录（并使用相同的文件名保存）

4. 如果远程系统上的帐户尚未包含〜/ .ssh / authorized_keys文件，请创建一个;
   在命令行上，输入以下命令：  
   ```
   mkdir -p ~/.ssh
   touch ~/.ssh/authorized_keys
   ```
   如果远程系统上的帐户已有〜/ .ssh /
   authorized_keys文件，则执行这些命令不会损坏现有目录或文件。  
   
5. 在远程系统上，将公钥文件的内容（例如，〜/ id_rsa.pub）添加到〜/ .ssh /
   authorized_keys文件中的新行; 在命令行上输入：   
   ```
   cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
   ```
    您可能需要检查〜/ .ssh / authorized_keys的内容以确保正确添加了公钥;
    在命令行上输入： 
    ```
    more ~/.ssh/authorized_keys
    ```
    
6. 您现在可以安全地从远程系统上的帐户中删除公钥文件（例如，〜/ id_rsa.pub）;
在命令行上输入  
    

