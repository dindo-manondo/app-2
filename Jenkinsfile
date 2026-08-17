// App Node - Node.js demo app showing standardPipeline's Build stage running
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
    sonarProjectKey: 'app-node',
    nodeJsToolName: 'NodeJS',
    // Windows note: npm is itself a .cmd batch script. Calling it without
    // 'call' inside another batch script transfers control into it and
    // never returns - the lines after the first npm invocation would
    // silently never run. Always prefix with 'call' for multi-command
    // buildCommand blocks on Windows agents.
    buildCommand: '''
        call npm install
        call npm run lint
        call npm test
        call npm run build
    ''',
    sonarScannerToolName: 'sonar-scanner',
    sonarScanCommand: '"%SONAR_SCANNER_HOME%\\bin\\sonar-scanner.bat" -Dsonar.projectKey=app-node -Dsonar.sources=.',
    envMap: [
        'main': 'prod',
        'release/*': 'staging',
        'develop': 'dev'
    ],
    defaultEnv: 'dev',
    deploySteps: { deployEnv ->
        echo "Would deploy to environment: ${deployEnv} (image pulled from Nexus)"
    },
    dockerImage: { deployEnv -> "app-node:${deployEnv}" }
)
