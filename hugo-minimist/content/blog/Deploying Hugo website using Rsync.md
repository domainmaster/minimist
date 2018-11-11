---
title: "Deploying Hugo Website Using Rsync"
date: 2017-08-15T00:35:17+04:00
draft: false
---

In my first post I mentioned that I'm planning to write a script to automate the deployment to this static blog built using Hugo. What I was expecting at first is that I'm going to write a script similar to:

```bash
ftp www.domainhere.com 
user useridhere
passwordhere
put index.html
```
But after searching I just realized FTP sessions cannot be automated this way. Instead it can be done using Powershell,  cURL, or a scripting language like Python. Then I came to [this github repo](https://github.com/mindok/hugodeploy) and discovered rsync.

Rsync is a synchronization tool (or 'file-copying' as described in their website), can be used locally or with remote servers. What makes rsync so popular is that it only syncs the portions of files that have been changed. Means less data to transfer and less time to sync. ---you know you don't have to upload your whole website every time you edit a typo!


### How to automate your static site
you can find a similar guide [here](https://gohugo.io/hosting-and-deployment/deployment-with-rsync/). I had some issues with it, so here is what I did.

#### 1. Enable SSH on your hosting server
In my case I'm using a shared hosting plan from [Namecheap](https://www.namecheap.com/support/knowledgebase/article.aspx/1016/89/how-to-access-a-hosting-account-via-ssh), so I just had to chat'em up to enable it for me. If you have a dedicated server, make sure to install/enable [OpenSSH](https://www.openbsd.org/).

If you are hosting your project on Github, you can easily host your whole static website for free on [Github Pages](https://pages.github.com/), and set up [Travis CI](https://travis-ci.org/) for automated builds and deployment. Check out this [tutorial](https://haruair.github.io/post/setup-hugo-blog-on-github-pages-with-travis-ci/).

#### 2. Install rsync
Most probably you already have it installed, to make sure, run in your terminal:
```bash
rsync --version
```
If it showed the version details, then skip this step. In case it's not installed, use the following commands to install using Homebrew package manager on mac OS:
```bash
brew tap homebrew/science
brew install rsync
```
If you have a windows machine, [this guide](https://github.com/AlanBarber/jbh/wiki/Installing-RSync-on-Windows) should be helpful.

#### 3. Test your SSH
Before you start with the script make sure that your ssh is working without errors (better than debugging later). Connect to your server using the following command:
```bash
ssh -p {port number} {user}@{server IP}
```
then enter your password.

If it worked then,
```bash
exit
```

{{< figure src="../sshConnect.png" caption="SSH connection should look something like this" alt="SSH connection">}}

#### 4. Write the Bash script
To do that, head to your terminal, then run the follwoing commands one by one

```bash
cd {your website directory}
nano deploy
```
then copy & paste this script and fill in the arguments in the curly brackets.
```bash
#!/bin/sh
USER={yourUsername} HOST={HostServerIP} DIR={DirectoryOfYourPublicWebsiteFiles} 
hugo && rsync -avz -e 'ssh -p {portNumber}' --delete public/ ${USER}@${HOST}:~/${DIR}
exit 0
```
DIR variable can be left empty if you want to copy to the root folder of your server.

What the script does is deleting the 'public' folder (which is the old copy of your generated site) then builds your website (hugo command) and copies the contents of the new generated public directory to your server. 

Because rsync keeps track of the copied folder, it will only copy the portions that have changed in your website. It's should be fast, rest assured.

{{< figure src="../deployScript.png" caption="After filling the arguments looks like this" alt="SSH connection">}}

after pasting the script exit the editor using (ctrl + x) on mac, and save the changes to the file. On the terminal again run the follwoing command:
```bash
chmod +x deploy
```
to make it an executable script.

#### 5. Run the script
Now that your have everything set up, whenever you make changes or want to puplish a new article just head up to your website directory in the terminal and run the script:
```bash
./deploy
```
or
```bash
source deploy
```


### links
- [Here is a great guide about rsync](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps)
- [Rsync documentation](https://download.samba.org/pub/rsync/rsync.html)
- [Netlify](https://www.netlify.com/) also offers free hosting and continuous deployment plans for static websites.

-- Omar

