<!-- DOCSIBLE START -->

# 📃 Role overview

## netboot



Description: Maintains a set of files for a dockerized Netboot.xyz envirionment










### Defaults

**These are static variables with lower priority**

#### File: defaults/main.yml

| Var          | Type         | Value       |
|--------------|--------------|-------------|
| [netboot_container_user](defaults/main.yml#L1)   | str | `root` |    
| [netboot_container_group](defaults/main.yml#L2)   | str | `root` |    
| [netboot_base_dir](defaults/main.yml#L3)   | str |  |    
| [netboot_mac_chain](defaults/main.yml#L5)   | list | `[]` |    
| [netboot_talos_schematic](defaults/main.yml#L7)   | str |  |    





### Tasks


#### File: tasks/chain.yml

| Name | Module | Has Conditions |
| ---- | ------ | -------------- |
| Create MAC custom local menu files | ansible.builtin.copy | False |
| Create MAC custom menu files | ansible.builtin.copy | False |

#### File: tasks/local.yml

| Name | Module | Has Conditions |
| ---- | ------ | -------------- |
| Copy local files to local | ansible.builtin.copy | False |
| Copy local files | ansible.builtin.copy | False |

#### File: tasks/main.yml

| Name | Module | Has Conditions |
| ---- | ------ | -------------- |
| Check if netboot menu file exists | ansible.builtin.stat | False |
| Include menu tasks if menu file exist | ansible.builtin.include_tasks | True |
| Include chain tasks | ansible.builtin.include_tasks | True |
| Include local tasks | ansible.builtin.include_tasks | False |
| Include Talos tasks | ansible.builtin.include_tasks | True |

#### File: tasks/menu.yml

| Name | Module | Has Conditions |
| ---- | ------ | -------------- |
| Copy remote menu | ansible.builtin.copy | False |
| Enable custom menu | ansible.builtin.lineinfile | False |
| Set custom menu | ansible.builtin.lineinfile | False |
| Copy menu to local | ansible.builtin.copy | False |
| Copy custom ipxe | ansible.builtin.copy | False |

#### File: tasks/talos.yml

| Name | Module | Has Conditions |
| ---- | ------ | -------------- |
| Get Talos schematic | ansible.builtin.uri | False |
| Set Talos schematic ID fact | ansible.builtin.set_fact | False |
| Get Latest Talos version | ansible.builtin.uri | False |
| Set Talos version fact | ansible.builtin.set_fact | False |
| Template ipxe file for Talos unattended install | ansible.builtin.template | True |
| Create Talos version directory | ansible.builtin.file | False |
| Download Talos kernel image | ansible.builtin.get_url | False |
| Download Talos initramfs image | ansible.builtin.get_url | False |


## Task Flow Graphs



### Graph for chain.yml

```mermaid
flowchart TD
Start
classDef block stroke:#3498db,stroke-width:2px;
classDef task stroke:#4b76bb,stroke-width:2px;
classDef includeTasks stroke:#16a085,stroke-width:2px;
classDef importTasks stroke:#34495e,stroke-width:2px;
classDef includeRole stroke:#2980b9,stroke-width:2px;
classDef importRole stroke:#699ba7,stroke-width:2px;
classDef includeVars stroke:#8e44ad,stroke-width:2px;
classDef rescue stroke:#665352,stroke-width:2px;

  Start-->|Task| Create_MAC_custom_local_menu_files0[create mac custom local menu files]:::task
  Create_MAC_custom_local_menu_files0-->|Task| Create_MAC_custom_menu_files1[create mac custom menu files]:::task
  Create_MAC_custom_menu_files1-->End
```


### Graph for local.yml

```mermaid
flowchart TD
Start
classDef block stroke:#3498db,stroke-width:2px;
classDef task stroke:#4b76bb,stroke-width:2px;
classDef includeTasks stroke:#16a085,stroke-width:2px;
classDef importTasks stroke:#34495e,stroke-width:2px;
classDef includeRole stroke:#2980b9,stroke-width:2px;
classDef importRole stroke:#699ba7,stroke-width:2px;
classDef includeVars stroke:#8e44ad,stroke-width:2px;
classDef rescue stroke:#665352,stroke-width:2px;

  Start-->|Task| Copy_local_files_to_local0[copy local files to local]:::task
  Copy_local_files_to_local0-->|Task| Copy_local_files1[copy local files]:::task
  Copy_local_files1-->End
```


### Graph for main.yml

```mermaid
flowchart TD
Start
classDef block stroke:#3498db,stroke-width:2px;
classDef task stroke:#4b76bb,stroke-width:2px;
classDef includeTasks stroke:#16a085,stroke-width:2px;
classDef importTasks stroke:#34495e,stroke-width:2px;
classDef includeRole stroke:#2980b9,stroke-width:2px;
classDef importRole stroke:#699ba7,stroke-width:2px;
classDef includeVars stroke:#8e44ad,stroke-width:2px;
classDef rescue stroke:#665352,stroke-width:2px;

  Start-->|Task| Check_if_netboot_menu_file_exists0[check if netboot menu file exists]:::task
  Check_if_netboot_menu_file_exists0-->|Include task| Include_menu_tasks_if_menu_file_exist_menu_yml_1[include menu tasks if menu file exist<br>When: **netboot cfg file stat exists**<br>include_task: menu yml]:::includeTasks
  Include_menu_tasks_if_menu_file_exist_menu_yml_1-->|Include task| Include_chain_tasks_chain_yml_2[include chain tasks<br>When: **netboot mac chain   length   0**<br>include_task: chain yml]:::includeTasks
  Include_chain_tasks_chain_yml_2-->|Include task| Include_local_tasks_local_yml_3[include local tasks<br>include_task: local yml]:::includeTasks
  Include_local_tasks_local_yml_3-->|Include task| Include_Talos_tasks_talos_yml_4[include talos tasks<br>When: **netboot talos schematic**<br>include_task: talos yml]:::includeTasks
  Include_Talos_tasks_talos_yml_4-->End
```


### Graph for menu.yml

```mermaid
flowchart TD
Start
classDef block stroke:#3498db,stroke-width:2px;
classDef task stroke:#4b76bb,stroke-width:2px;
classDef includeTasks stroke:#16a085,stroke-width:2px;
classDef importTasks stroke:#34495e,stroke-width:2px;
classDef includeRole stroke:#2980b9,stroke-width:2px;
classDef importRole stroke:#699ba7,stroke-width:2px;
classDef includeVars stroke:#8e44ad,stroke-width:2px;
classDef rescue stroke:#665352,stroke-width:2px;

  Start-->|Task| Copy_remote_menu0[copy remote menu]:::task
  Copy_remote_menu0-->|Task| Enable_custom_menu1[enable custom menu]:::task
  Enable_custom_menu1-->|Task| Set_custom_menu2[set custom menu]:::task
  Set_custom_menu2-->|Task| Copy_menu_to_local3[copy menu to local]:::task
  Copy_menu_to_local3-->|Task| Copy_custom_ipxe4[copy custom ipxe]:::task
  Copy_custom_ipxe4-->End
```


### Graph for talos.yml

```mermaid
flowchart TD
Start
classDef block stroke:#3498db,stroke-width:2px;
classDef task stroke:#4b76bb,stroke-width:2px;
classDef includeTasks stroke:#16a085,stroke-width:2px;
classDef importTasks stroke:#34495e,stroke-width:2px;
classDef includeRole stroke:#2980b9,stroke-width:2px;
classDef importRole stroke:#699ba7,stroke-width:2px;
classDef includeVars stroke:#8e44ad,stroke-width:2px;
classDef rescue stroke:#665352,stroke-width:2px;

  Start-->|Task| Get_Talos_schematic0[get talos schematic]:::task
  Get_Talos_schematic0-->|Task| Set_Talos_schematic_ID_fact1[set talos schematic id fact]:::task
  Set_Talos_schematic_ID_fact1-->|Task| Get_Latest_Talos_version2[get latest talos version]:::task
  Get_Latest_Talos_version2-->|Task| Set_Talos_version_fact3[set talos version fact]:::task
  Set_Talos_version_fact3-->|Task| Template_ipxe_file_for_Talos_unattended_install4[template ipxe file for talos unattended install<br>When: **netboot talos schematic id is defined**]:::task
  Template_ipxe_file_for_Talos_unattended_install4-->|Task| Create_Talos_version_directory5[create talos version directory]:::task
  Create_Talos_version_directory5-->|Task| Download_Talos_kernel_image6[download talos kernel image]:::task
  Download_Talos_kernel_image6-->|Task| Download_Talos_initramfs_image7[download talos initramfs image]:::task
  Download_Talos_initramfs_image7-->End
```





## Author Information
Roxedus

#### License

Apache-2.0

#### Minimum Ansible Version

2.9

#### Platforms

No platforms specified.

#### Dependencies

No dependencies specified.
<!-- DOCSIBLE END -->