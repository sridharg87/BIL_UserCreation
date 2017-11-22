#!/usr/bin/env groovy

pipeline {
    agent any

    tools { 
        maven 'Maven-3.5.0' 
        jdk 'JDK_1.7' 
        git 'GIT'
    }
    
    environment { 
        MAVEN_LOCAL_REPO = 'C:\\Localhost\\Temenos\\R17\\Env\\Slot01\\Products\\DesignStudio\\t24-binaries'
        T24_HOME_PACKAGE = 'C:\\Localhost\\Temenos\\R17\\Env\\Slot01\\Data\\T24\\UD\\package'
        T24_HOME = 'C:\\Localhost\\Temenos\\R17\\Env\\Slot01\\Data\\T24\\UD'
        TAFJ_HOME = 'C:\\Localhost\\Temenos\\R17\\Env\\Slot01\\Products\\TAFJ\\Default'
        JAVA_HOME = 'C:\\Localhost\\Temenos\\R17\\Infra\\Java\\Default'
        
        PACKAGE_PREFIX = 'Accenture'
        
    }

    stages {
        stage('Build') {
            steps {
               echo 'Building..'
               echo 'PATH = $PATH'
               
               bat 'mvn -B -o -f %PACKAGE_PREFIX%-packager/module/pom.xml -Dmaven.repo.local=%MAVEN_LOCAL_REPO% -Dds.ignoreValidationErrors=true clean install'
               
               step([$class: 'ArtifactArchiver', artifacts: '**/target/*.jar', fingerprint: true])
            }
        }
        
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying....'    

                echo "Copy package to %T24_HOME_PACKAGE%"

                bat 'copy .\\%PACKAGE_PREFIX%-packager\\target\\R17**.jar \"%T24_HOME_PACKAGE%\" /Y'

                echo 'Installation - phase 1 - T24PackageInstaller'
            
                bat '''
                   call "C:\\Localhost\\Temenos\\R17\\Env\\Slot01\\Products\\DesignStudio\\GIT\\setenv.cmd"
                   tRun.bat -cf tafj T24PackageInstaller
                '''
                
                echo 'Installation - phase 2 - packageDataInstaller'
                bat returnStatus: true, script: '''
                    call "C:\\Localhost\\Temenos\\R17\\Env\\Slot01\\Products\\DesignStudio\\GIT\\setenv.cmd"
                    tRun.bat -cf tafj packageDataInstaller
                '''
            }
        }
    }
}