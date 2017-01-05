node {

    stage ('Git clone') {
        checkout scm
    }

    stage ('Bundle install') {
        sh 'chef exec bundle install'
    }

}

def userInput = true
def didTimeout = false

stage ('Version and Upload') {
    
    // see https://go.cloudbees.com/docs/support-kb-articles/CloudBees-Jenkins-Enterprise/Pipeline---How-to-add-an-input-step,-with-timeout,-that-continues-if-timeout-is-reached,-using-a-default-value.html
    try {
        timeout(time: 15, unit: 'SECONDS') {
            choice = new ChoiceParameterDefinition('Version Part:', ['patch', 'minor', 'major'] as String[], '')
            versionPart = input message: 'Bump major, minor or patch version?', parameters: [choice]
        }
    } catch(err) { // timeout reached or input false
        def user = err.getCauses()[0].getUser()
        if('SYSTEM' == user.toString()) { // SYSTEM means timeout.
            didTimeout = true
        } else {
            userInput = false
            echo "Aborted by: [${user}]"
        }
    }

}

node {
    if (didTimeout) {
        echo "No cookbook upload was triggered within timeout"
    } else if (userInput == true) {
        sh "chef exec thor version:bump ${versionPart}"
        def newVersion = readFile('VERSION')
        // that's where we want to bump the version and upload the cookbook
        currentBuild.displayName = "${currentBuild.getNumber()} - ${newVersion} (${versionPart})"
    } else {
        echo "No cookbook upload was triggered within timeout"
    }
}



