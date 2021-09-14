# Golden-Waffles

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Untitled Diagram(1) drawio(1)](https://user-images.githubusercontent.com/90206548/133177781-206310e1-4029-4395-a03c-3106dea7a236.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml file may be used to install only certain pieces of it, such as Filebeat.


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable, in addition to restricting access to the network.
- Load balancers have an off-loading function which defends an organization against DDoS attacks. This function works by shifting attack traffic. 

The advantage of a jump box is it sits between VMs on a network and forces all traffic through a single node. This allows you to focus on interactions between routers rather than monitoring all of your machines at once. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.
- Filebeat monitors log files for changes and collects log events which is forwarded to an Elasticsearch for indexing. 
- Metricbeat records metrics from the systems and services running on a server and then based on the specified output, such as Elasticsearch or Logstash, you can view these metrics.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump-Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | Server   | 10.0.0.5   | Linux            |
| Web-2    | Server   | 10.0.0.6   | Linux            |
| Elk      | Monitor  | 10.1.0.5   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 99.89.239.31

Machines within the network can only be accessed by Jump-Box.
- Jump-Box 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump-Box | Yes                 | 99.89.239.31         |
| Web-1    | No                  | 10.0.0.4             |
| Web-2    | No                  | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The main advantage of automating configuration with Ansible is saving time. Rather than spending time configuring machines manually, you can now configure them in minutes by running scripts called playbooks.

The playbook implements the following tasks:
- Install Docker.io
- Install Python3-pip
- Install Docker; since this is a Docker Python pip module we had to install pip first.
- Increase the memory; this was needed in order to run the elk container.
- Download and Run Docker Elk Container on published ports 5601:5601, 9200:9200, 5044:5044.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker_ps_output](https://user-images.githubusercontent.com/90206548/132817491-2173b2c0-f409-4a9f-8d8d-50d1c50bef0c.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.0.0.5
- Web-2: 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log events and monitors which files have been changed, what was changed, who made the changes, and when the changes were made. If someone accessed your /etc/shadow or password folders this is the type of information you would want to look for in you Filebeat.
- Metricbeat focuses on collecting the metrics of the machine. You'll be looking at how long the machine was powered on, when was it powered off, CPU usage, hard drive usage, and ram usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible.
- Update the /etc/ansible/hosts file to include a section for [elk] followed by the private IP of your Elk VM along with the python line ansible_python_interpreter=/usr/bin/python3. See below for example.
[elk]
10.1.0.5 ansible_python_interpreter=/usr/bin/python3 

Only the [webservers] will be running Filebeat.
- Run the playbook, and navigate to http://23.99.93.74:5601/ to check that the installation worked as expected.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
- ansible-playbook install-elk.yml
- ansible-playbook filebeat-playbook.yml
- ansible-playbook metricbeat-playbook.yml
