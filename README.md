Description
===========

This Cookbook installs kallisto, a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads.

http://pachterlab.github.io/kallisto

Requirements
============

## Platform:

* Centos 6.6

Notes
=====
Kallisto uses a cmd line arg that requires a newer gcc version than the one that ships with cent-os 6.6 so we have stuck to the default binary install for now.

Usage
=====
Simply include the recipe wherever you would like it installed, such as a run list (recipe[kallisto]) or a cookbook (include_recipe 'kallisto')


## Testing
To test the recipe we use chef test kitchen:

kitchen converge default-centos66 

kitchen login default-centos66

kitchen verify default-centos66

kitchen destroy default-centos66

Attributes
==========

See attributes/default.rb for the install flavour:

    default['kallisto']['version'] =  'v0.42.4'
    
    
License and Authors
===================

* Authors:: Bart Ailey (<chef@eaglegenomics.com>)
* Authors:: Dan Barrell (<chef@eaglegenomics.com>)
* Authors:: Nick James (<chef@eaglegenomics.com>)    

Copyright:: 2015, Eagle Genomics Ltd

    
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    
ToDo
====
 
