import csv

# qute = ""
rang = ""
bash = ""

#with open(".config/qutebrowser/keys.conf.base") as qb:
#    qute+=qb.read()
with open("/home/ben/dotfiles/ranger/rc.conf.base") as rg:
    rang+=rg.read()
with open("/home/ben/dotfiles/bashrc.base") as bsh:
    bash+=bsh.read()

#First we open the list of folder shortcuts and go down each line adding each in the required syntax to each of the three configs:

with open("/home/ben/dotfiles/scripts/folders") as fold:
    for line in csv.reader(fold, dialect="excel-tab"):
        #Adds the qutebrowser downloads commands:
        #print(line)
#       qute+="set storage download-directory "+line[1]+" ;; hint links download\n\t;"+line[0]+"\n"
        #Adds the ranger go, tab, move and yank commands:
        rang+=("map g"+line[0]+" cd "+line[1]+"\n")
        rang+=("map t"+line[0]+" tab_new "+line[1]+"\n")
        rang+=("map m"+line[0]+" shell mv %s "+line[1]+"\n")
        rang+=("map Y"+line[0]+" shell cp -r %s "+line[1]+"\n")
        #Adds the bash shortcuts:
        bash+=("alias "+line[0]+"=\"cd "+line[1]+" && ls -t\"\n")

#Goes thru the config file file and adds the shortcuts to both bash and ranger.

with open("/home/ben/dotfiles/scripts/configs") as conf:
    for line in csv.reader(conf, dialect="excel-tab"):
        #print(line)
        bash+=("alias "+line[0]+"=\"geany "+line[1]+"\"\n")
        rang+=("map "+line[0]+" shell geany "+line[1]+"\n")

#print(bash)

with open("/home/ben/.config/ranger/rc.conf", "w") as outrang:
    outrang.write(rang)
# with open(".config/qutebrowser/keys.conf","w") as outqb:
#     outqb.write(qute)
with open("/home/ben/.bashrc","w") as outbash:
    outbash.write(bash)
