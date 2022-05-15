
pipeline {
    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(daysToKeepStr: '30'))
        timeout(time: 60)
    }
    agent any
    stages {
        stage('Checkout SCM') {
            steps {
                cleanWs()
                sh 'git clone https://github.com/wush978/DSRPlus.git'
            }
        }
        stage('Build Docker') {
            matrix {
                axes {
                    axis {
                        name 'RVERSION'
                        values '4.2.0'
                    }
                }
                stages {
                    stage('Build Docker') {
                        steps {
                            sh 'docker build -t dsr-plus/test:${RVERSION} -f DSRPlus/.test/docker/Dockerfile-${RVERSION} .'
                        }
                    } // Build Docker
                    stage('Test') {
                        steps {
                            sh 'docker run --rm -v $(pwd)/DSRPlus:/var/DSRPlus -e http_proxy -e https_proxy dsr-plus/test:${RVERSION} Rscript /var/DSRPlus/.test/test-lesson.R DSRPlus 00-Hello-DSRPlus'
                        }
                    } // Test
                } // stages
            } // matrix
        } // Build Docker
    } // stages
}
