stage('hello') {
  Map feedback = input(submitterParameter: 'submitter', message: "tell me something", parameters: [
    [$class: 'TextParameterDefinition', name: 'text', description: "don't care"]
  ])

  echo "Text: ${feedback.text}"
  echo "Submitter: ${feedback.submitter}"
}
