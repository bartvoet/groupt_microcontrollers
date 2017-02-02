## Waarom een versionerings-systeem?

Een versionerings-systeem houdt zal voor een groep tekst-files de historiek en wijzigingen bijhouden en stelt je in staat 



Waarom git, dit kan het best uitgelegd worden wanneer je 

Git is een versionerings-systeem, het 

## Aanmaken van een lokale git-repository

Om een lokale git-repo (of repository) aan te maken voer je de 2 volgende acties uit:

* Je maakt een directory aan, in het geval van de oefening noemen we deze "hello_git"
* Binnen deze directory voer het je het git-subcommando "git init" uit

$ mkdir hello_git
$ cd hello_git
$ git init
Initialized empty Git repository in /home/bart/Data/Tryout/hello_git/.git/
$ ls -a
.  ..  .git

Het resultaat hiervan is dat de folder "hello_git" een folder ".git" bevat.  
De aanwezigheid .git zorgt er voor dat de git-client (command line voor deze oefening) hello_git herkent als een git-repo.  

Deze .git-folder wordt gebruikt door de git-client om commits en andere (meta-data) op te slaan, in principe hoef je deze folder nooit zelf te gebruiken.  

## Een file toevoegen



$ touch a.txt
$ ls -a
$ git status
$ git add a.txt
$ git status


echo "test" >> a.txt
ls
git log
git status
cat a.txt
git status
git commit -m "Adding file to git-repo"
git log
git status
git add a.txst
git add a.txt
git status
echo " blabla" >> a.txt
git status
cat a.txt
git status
git add a.txt
git status
git commit -m "Adding some changes"
git log
git show
git show 78c2bf8
mkdir hello
cd hello
echo "test" >> een_file.txt
git status
cd ..
git status
git add hello
git status
git commit -m "een nieuwe directory en file"
git log
git log --decorate
ls
git rm a.txt
git status
git commit -m "file removed"
git log
