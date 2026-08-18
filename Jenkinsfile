// App Node - onboarded via jenkins-pipeline-configs using the folder + Multibranch
// Pipeline pattern. This Jenkinsfile is intentionally just this one call - all
// actual pipeline config (sonarProjectKey, buildCommand, sonarScanCommand,
// envMap, dockerImage, deploySteps, etc.) lives in
// jenkins-pipeline-configs/teams/app-node.yaml, not here. standardPipeline()
// fetches that file itself at runtime, so this repo has no path to skip
// SonarQube, Trivy, or the Nexus push - only whoever owns
// jenkins-pipeline-configs controls that. See standardPipeline.groovy's
// header comment for the full contract.

@Library('jenkins-shared-library') _

standardPipeline('app-node')
