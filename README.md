# CytoCopasi

CytoCopasi is a Cytoscape app that enables modeling, importing, simulating, and comparing biochemical reaction networks. It uses the Java bindings of Complex Pathway Simulator (COPASI) for quantitative systems biology modeling. 

Besides the regular ODE-based tasks, such as time course simulation and steady state analysis, users can also superimpose and compare two chemical reaction networks (e.g., a healthy vs diseased state) to display the concentration deviations at steady state. Users can also manually perturb a model by modifying one or more parameters of their choice (e.g., the activity of an enzyme or the initial concentration of a drug molecule) and visualize the downstream effects on the steady state profile.

## Features

●	Systems Biology Markup Language (SBML) support

●	Import local SBML files

●	Direct connection to KEGG for importing pathways and converting them into SBML

●	Extract KEGG modules as subnetworks

●	Supports BRENDA’s SOAP access for enzyme functional data queries

●	Comparative reaction network visual analytics 

●	Perturbation analysis capable of visualizing downstream effects due to mutations or drug treatment



## Installation

### System Requirements

●	Windows, Linux, Unix, or MacOS operating system

●	Cytoscape 3.8. or above https://cytoscape.org/ 

●	Java OpenJDK 11.0.14 or above

### Important: Native Libraries

The CytoCopasi JAR file contains native library files CopasiJava.dll, libCopasiJava.jnilib, and libCopasiJava.so for Windows, MacOS, and Linux/Unix, respectively.

The recent version of CytoCopasi can load these libraries automatically during start up; however, should Cytoscape throw an "Unsatisfied Link Error", you can alternatively try to manually copy the appropriate native library to a directory in your java.library.path and restart Cytoscape.


#### How to see the current value of the java.library.path variable

Java.library.path usually contains multiple directories, but the user can copy the native library to any of them. 

For all OS types: Open Terminal and type

        java -XshowSettings:properties  

Find the java.library.path section in the output; it should look like below:

        java.library.path = C:\Program Files (x86)\Common Files\Oracle\Java\javapath

        C:\windows\Sun\Java\bin
        
        C:\windows\system32
        
        C:\windows
        C:\Program Files (x86)\Common Files\Oracle\Java\javapath
        
        C:\Program Files\copasi.org\COPASI 4.40.278\bin
        
        C:\windows\system32
        
        C:\windows
        
        C:\windows\System32\Wbem
        
        C:\windows\System32\WindowsPowerShell\v1.0\
        
        C:\windows\System32\OpenSSH\
        
        C:\Users\27608\Downloads\apache-maven-3.9.0\bin
        
        C:\Program Files\Git\cmd
        
        C:\Program Files\Git LFS
        
        C:\Users\27608\AppData\Local\Microsoft\WindowsApps
        
        C:\Users\27608\AppData\Local\GitHubDesktop\bin
 
#### To Copy the Native Library to Your java.library.path:
● Download the executable from the Releases section https://github.com/scientificomputing/CytoCopasi

● Download the additional files as .zip and extract them into a new folder, which will be named CytoCopasi-main


#### Mac OS X

● After downloading and extracting, go to CytoCopasi-main/Native Libraries/

● The correct type of Mac OS X native library depends on your Mac processor. If you are not sure, this [article](https://www.makeuseof.com/how-to-find-out-if-your-mac-uses-intel-or-apple-silicon/) explains how to find out.

   For intel (x64): open the folder Mac OS X (Intel)
   
   For M1/M2 chips: open the folder Mac OS X M1M2
   
● Open terminal and type:

        sudo cp libCopasiJava.jnilib <the selected java.library.path directory>
  ex: 
        sudo cp libCopasiJava.jnilib /Library/Java/Extensions
  
● Enter your user password when prompted.

#### Windows

● Go to CytoCopasi-main/Native Libraries/Windows

● Run terminal (Windows PowerShell) as administrator (this option will appear when you right-click on the terminal icon.

          cp CopasiJava.dll <the selected java.library.path directory>


#### Linux/Unix

● Go to CytoCopasi-main/Native Libraries/Linux

● Open terminal and type

        sudo cp libCopasiJava.so <selected java.library.path directory>


### Installation

Since CytoCopasi is not yet available on App Store, you need to install it in one of the following two methods.

#### 1-	App Manager

Click on “Install from file” on the App Manager Dialog, and find the CytoCopasi-1.0.jar file in the repository you downloaded.

#### 2-	Copy the downloaded jar file

Copy CytoCopasi-1.0.jar file to [...]/CytoscapeConfiguration/3/apps/installed

Once the installation is complete, you will see the CytoCopasi tab on the left panel space




