@Library('jenkins-shared-library') _ 

def configMap = [
    project : "roboshop",
    component: "catalogue"
]
nodejsEKSPipeline(configMap) //  by default it will call, call function inside this pipeline


/* @Library('jenkins-shared-library') _ //same file but in the middile of the class eding if/else

def configMap = [
    project : "roboshop",
    component : "catalogue"
]

if( ! env.BRANCH_NAME.equalsIgnoreCase('main') ){ //if not equals to main
    nodejsEKSPipeline(configMap) // by default it will call, call function inside this pipeline
}
else{
    echo "Please procee with PROD process"
}
  */



// pipeline {
//     agent  {
//         label 'AGENT-1'
//     }
//     environment { 
//         appVersion = ''
//         REGION = "us-east-1"
//         ACC_ID = "632745187858"
//         PROJECT = "roboshop" 
//         COMPONENT = "catalogue"
//     }
//     options {
//         timeout(time: 30, unit: 'MINUTES') 
//         disableConcurrentBuilds()
//     }
//     parameters {
//         booleanParam(name: 'deploy', defaultValue: false, description: 'Toggle this value')
//     }
//     //Build
//     stages {
//         stage('Read package.json') {
//             steps {
//                 script {
//                     def packageJson = readJSON file: 'package.json'
//                     appVersion = packageJson.version
//                     echo "Package version: ${appVersion}"
//                 }
//             }
//         }
//         stage('Install Dependencies') {
//             steps {
//                 script {
//                    sh """
//                         npm install
//                    """
//                 }
//             }
//         }
//         stage('Unit Testing') {
//             steps {
//                 script {
//                     sh """
//                         echo "unit tests"
//                     """
//                 }
//             }
//         }
//         /* stage('Sonar Scan') { //this file added here on 20/08/25 sonarqube creation 
//             environment {
//                 scannerHome = tool 'sonnar-7.2'
//             }
//             steps {
//                 script {
//                     // Spnar Server environment
//                     withSonarQubeEnv(installationName: 'sonnar-7.2') {
//                         sh "${scannerHome}/bin/sonar-scanner"
//                     }
//                 }
//             }
//         } */
//         // Enable webhook in sonarqube server and wait for results (added 21/08/25)
//         /* stage("Quality Gate") {
//             steps {
//                 timeout(time: 1, unit: 'HOURS') {
//                 waitForQualityGate abortPipeline: true }
//             }
//         } */
//         /* stage('Check Dependabot Alerts') {
//             environment {
//                 GITHUB_TOKEN = credentials('github-token')
//             }
//             steps {
//                 script {
//                     //Fetch alerts from Github
//                     def response = sh(
//                         script: """
//                             curl -S -H "Accept: application/vnd.github+json" \
//                                 -H "Authorization: token ${GITHUB_TOKEN}" \
//                                 https://api.github.com/repos/Sreekanthp001/catalogue/dependabot/alerts
//                         """,
//                         returnStdout: true
//                     ).trim()
//                     // Parse JSON
//                     def json = readJSON text: response

//                     // Filter alerts by severity
//                     def criticalOrHigh = json.findAll { alert ->
//                         def severity = alert?.security_advisory?.severity.toLowerCase()
//                         def state = alert?.state?.toLowerCase()
//                         return (state == "open" && (severity == "critical" || severity == "high"))
//                     }

//                     if (criticalOrHigh.size() > 0) {
//                         error "❌ Found ${criticalOrHigh.size()} HIGH/CRITICAL Dependabot alerts, Failing pipeline!"  
//                     } else {
//                         echo "✅ No HIGH/CRITICAL Dependabot alerts found."
//                     }
//                 }
//             }
//         } */
//         /* stage('Docker Build') {
//             steps {
//                 script {
//                     withAWS(credentials: 'aws-creds', region: 'us-east-1') {
//                         sh """
//                             aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com
//                             docker build -t ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com/${PROJECT}/${COMPONENT}:${appVersion} .
//                             docker push ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com/${PROJECT}/${COMPONENT}:${appVersion} 
//                         """
//                     }
//                 }
//             }
//         } 
//         //this one added on 22/08/25 for quality gate implemnting in ECR 
//         stage('Check Scan Results') {
//             steps {
//                 script {
//                     withAWS(credentials: 'aws_creds', region: 'us-east-1') {
//                         //fetch scan findings
//                         def findings = sh(
//                             script: """
//                                 aws ecr describe-image-scan-findings \
//                                 --repository-name ${PROJECT}/${COMPONENT} \
//                                 --image-id imageTag=${appVersion} \
//                                 --region ${REGION} \
//                                 --output json
//                             """,
//                             returnStdout: true
//                         ).trim()

//                         //parse json
//                         def json = readJSON text: findings

//                         def highCritical = json.imageScanFindings.findings.findAll {
//                             it.servity == "HIGH" || it.severity == "CRITICAL"
//                         }

//                         it (highCritical.size() > 0) {
//                             echo "❌ Found ${highCritical.size()} HIGH/CRITICAL vulnerabilities!"
//                             currentBuild.result = 'FAILURE'
//                             error("Build faild due to vulnerbilities")
//                         }else {
//                             echo "✅ No HIGH/CRITICAL vulnerabilities found."
//                         }
//                     }
//                 }
//             } 
//         }*/

//         stage('Trigger Deploy') {
//             when{
//                 expression { params.deploy }
//             }
//             steps {
//                 script {
//                     build job: 'catalogue-cd', 
//                     parameters: [
//                         string(name: 'appVersion', value: "${appVersion}"),
//                         string(name: 'deploy_to', value: 'dev')
//                     ],
//                     propagate: false, //even sg fails vpc will not be effected
//                     wait: false //vpc will not wait for sg pipeline completion
//                 }
//             }
//         }
//     }
//     post { 
//         always { 
//             echo 'I will always say Hello again!'
//             deleteDir()
//         }
//         success { 
//             echo 'Hello Success'
//         }
//         failure { 
//             echo 'Hello Failure'
//         }
//     }
// }

