stage('hello') {
  def feedback = input(submitterParamter: 'submitter', message: "tell me something", parameters: [
    [$class: 'TextParameterDefinition', name: 'test', description: "don't care"]
  ])

  echo feedback
}
