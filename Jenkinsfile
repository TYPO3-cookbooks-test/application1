stage('hello') {
  def feedback = input(submitterParameter: 'submitter', message: "tell me something", parameters: [
    [$class: 'TextParameterDefinition', name: 'test', description: "don't care"]
  ])

  echo feedback
}
