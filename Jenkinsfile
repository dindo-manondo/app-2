// App 2 - Node.js demo app showing standardPipeline's Build stage running
// MULTIPLE commands (lint, test, build) as one multi-line buildCommand -
// each line runs as a separate command in the same batch session, and the
// stage fails if any of them fails, same as a hand-written .bat file.
//
// nodeJsToolName / sonarScannerToolName are the opt-in tool resolutions
// added for exactly this kind of non-Maven project: they put this Jenkins
// instance's NodeJS and SonarQube Scanner tool installations to work
// without hardcoding an agent-specific path anywhere in this file.

@Library('jenkins-shared-library') _

standardPipeline(
    sonarProjectKey: 'app-2',
    nodeJsToolName: 'NodeJS',
    buildCommand: '''
        npm ci
        npm run lint
        npm test
        npm run build
    ''',
    sonarScannerToolName: 'sonar-scanner',
    sonarScanCommand: '"%SONAR_SCANNER_HOME%\\bin\\sonar-scanner.bat" -Dsonar.projectKey=app-2 -Dsonar.sources=.',
    envMap: [
        'main': 'prod',
        'release/*': 'staging',
        'develop': 'dev'
    ],
    defaultEnv: 'dev',
    deploySteps: { deployEnv ->
        echo "Would deploy to environment: ${deployEnv}"
        bat "podman build -t app-2:${deployEnv} ."
    }
)
