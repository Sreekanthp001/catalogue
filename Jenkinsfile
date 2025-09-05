@Library('jenkins-shared-library') _ //line no 1 to 6 1st nd remaining 2nd 

def configMap = [
    project : "roboshop",
    component: "catalogue"
]
if( ! env.BRANCH_NAME.equalsIgnoreCase('main') ){ //if not equals to main
    nodejsEKSPipeline(configMap) // by default it will call, call function inside this pipeline
}
else{
    echo "Please procee with PROD process"
}

