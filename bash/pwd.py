import os

pwd = os.getcwd()

home = os.path.expanduser("~")
dev = os.environ["YU_HOME"]
github = dev + "/github.com"
yu = github + "/seansu4you87"
kupo = os.environ["KUPO_HOME"]
dottie = os.environ["DOTTIE_HOME"]
dd = os.environ["DOORDASH_HOME"]

pwd = pwd.replace(dd, "~dd", 1)
pwd = pwd.replace(dottie, "~dots", 1)
pwd = pwd.replace(kupo, "~kupo", 1)
pwd = pwd.replace(yu, "~yu", 1)
pwd = pwd.replace(github, "~github", 1)
pwd = pwd.replace(dev, "~dev", 1)
pwd = pwd.replace(home, "~", 1)


if len(pwd) > 40:
    pwd = pwd[:10] + "..." + pwd[-30:]

print pwd
