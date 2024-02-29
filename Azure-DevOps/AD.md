  1  sudo apt update
    2  sudo apt install openjdk-17-jdk maven -y
    3  mkdir myagent && cd myagent
    4  myagent$ tar zxvf ~/Downloads/vsts-agent-linux-x64-3.220.5.tar.gz
    5  sudo tar zxvf ~/Downloads/vsts-agent-linux-x64-3.220.5.tar.gz
    6  ~/myagent$ ./config.sh
    7  ./config.sh
    8  ls
    9  wget https://vstsagentpackage.azureedge.net/agent/3.220.5/vsts-agent-linux-x64-3.220.5.tar.gz
   10  sudo tar zxvf ~/Downloads/vsts-agent-linux-x64-3.220.5.tar.gz
   11  ls
   12  sudo tar vsts-agent-linux-x64-3.220.5.tar.gz
   13  sudo tar zxvf vsts-agent-linux-x64-3.220.5.tar.gz
   14  ./config.sh
   15  sudo ./config.sh
   16  ls
   17  sudo chmod +x config.sh
   18  ./config.sh
   19  sudo chmod 777 -R /home/ubuntu/myagent/_diag
   20  sudo chmod 777 -R /home/ubuntu/myagent
   21  ./config.sh
   22  ls
   23  ./run.sh
   24  history

   ## &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
   ## $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4
   ## %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ## Planig--->develop--->testing--->bugs--->Relaese(deployement)
   ## Normal configuration tools::::::::::::
   ## Sytem admin and development
   Whenever the devops teams wrote some configuration script(to automate and reduce errors) that script will be used by developer and others.
  ## If developer need any additional software  then Configuartion tools have revert feature .
  * Configuartion drift---> change in desired configuarion to actual configuartion

## AZURE DEVOPS::::::::::::
* ![pre](AZ-Images/17-Devops%20workflow.png)
* Boards--->For plannings
* Repository---> for source code management(CODE STORE)
* Pipelines--->CI(test plans-test plans)CD
* ## S[rints::
* ## bpards--->Workitem()
* Sprint-15 days it will generally
* scrum meetings
* developers testers project leader sit together and discuss about sprint
* ## Repos::


%%%%%%%%%%%%%%%^^^^^^^^^^^^^^^^^&&&&&&&&&&&&**************((((((((((((((((()))))))))))))))))

## AZURE ARTIFACTS CRAETION:::
* First we need to create seperate personal access token for Artifacts.
* 

## Aure Devops Pull request::
*  In Azure DevOps, the pull request feature is integrated with the Azure DevOps Repos, which allows teams to review code, discuss changes, and collaborate on code development. It also provides a way to track and manage code changes and allows teams to automate code review and merge workflows.

## What is the task in Azure Devops??
* A task performs an action in a pipeline. For example, a task can build an app, interact with Azure resources, install a tool, or run a test. Tasks are the building blocks for defining automation in a pipeline.

## Differentiate between Jira and Azure DevOps.
Jira and Azure DevOps are both popular tools for managing software development projects, but they have some key differences in terms of their features and capabilities:

Purpose: Jira is primarily focused on issue tracking and agile project management, while Azure DevOps is a more comprehensive solution that includes features for source control, continuous integration and delivery, testing, and project management.
Integration: Jira has a large number of integrations available, including integration with a wide range of development tools and services, while Azure DevOps is tightly integrated with other Azure services and also offers integration with a wide range of development tools and services.
Scaling: Jira is more suited for small to medium-sized teams and projects, while Azure DevOps is better suited for large, enterprise-level projects with a lot of users and a lot of data.
Pricing: Jira offers both a cloud-based and on-premise version, with different pricing options for each, while Azure DevOps is primarily a cloud-based service, with different pricing options based on the number of users and the level of service needed.
UI and Customization: Jira has a more customizable interface and can be tailored to the specific needs of a team or organization. Azure DevOps has a more polished interface but with less flexibility in terms of customizing the layout and workflow.

## What different types of backlogs and board options are available in Azure boards?
Azure Boards offers several types of backlogs and boards, including

Product backlog: This is a prioritized list of work items that need to be completed for a project.
Sprint backlog: This is a subset of the product backlog that is specific to a particular sprint or iteration.
