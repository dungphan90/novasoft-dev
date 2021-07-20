Developing NOvASoft on your own personal computer.
- Dependencies are handled by SL7 docker with CVMFS installed. Credit of this work goes to Adam L. Lyon. See https://github.com/lyon-fnal/devenv for detailed information of the development environment. This is tested to run on Mac. It also works on Arch and Ubuntu.
- Using CMake build here. Later on, I woud like to use CLion to read the build the code. The JetBrain's IntelliSense is just too good for me to not use. I followed this tutorial (https://blog.jetbrains.com/clion/2020/01/using-docker-with-clion/) to make CLion to work with Docker. CLion is free for students and offers hefty discount for educators, and I strongly recommend it. I paid for it after 5 years of free student lisence.
- FNAL developed a really useful tool to assist buildng multiple products in a single area. Please see https://cdcvs.fnal.gov/redmine/projects/novaart/wiki/Editing_Code_with_CMake_and_buildtool to learn more about this tool.
- NOvaSoft has started to migrate to git so we will try to use git repo instead of SVN repo. For now, I only use the `dev-cmake` branch of `https://github.com/dungphan90/git-test-trimmed`. Soon, I will update the `mrb` script to allow to pick any branch or tag that I need.
---

How to use this.
```
git clone --recurse-submodules https://github.com/dungphan90/novasoft-dev.git
cd novasoft-dev
./setup_novasoft_docker.sh <your_username> <dockerhub_username>
./build.sh
./run.sh
```
Now, you are already in SL7 container shell. You should be at `/home/$USER/novasoft`. We will use a modified version of `gpvm_novasoft_mrb.sh` script to setup the build area.
```
source ./novasoft_mrb.sh develop e19 prof <folder_name>
```
At the end of the script's print out, there are a chunk of codes that you can copy to `.profile` so you call the defined functions to quickly setup the development environment next time you log in/out of the container. My preference is to copy this chunk of codes to `${MRB_SOURCE}/../config.sh`. Everytime I log in to the container, I just need to source the `config.sh` script and call the function I need.
```
source ${MRB_SOURCE}/../config.sh
develop_trunk_nova
mrb i --generator ninja 
```
At some point, the build will stop due to the issue with `boost` library. Just keep building with `ninja install`. It is going to take about 10-20 minutes for the build to finish, depending on your machine. 
