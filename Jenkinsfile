// Build a pipeline with custom steps:

def pipelineBuilder = org.typo3.chefci.v2.Pipeline.builder(this, steps)
pipelineBuilder.withHelloWorldStage()

def pipeline = pipelineBuilder.build()
pipeline.execute()


// Build a default pipeline

/*

org.typo3.chefci.v2.Pipeline.builder(this, steps).buildDefaultPipeline().execute()

*/