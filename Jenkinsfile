pipeline {
    agent any     
    stages {
        stage('Mostrar en pantalla') {
            steps {
                echo "Hola mundo desde git"
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/jadema15/demo-11.git']]])

            }            
        }

        stage('Mostrar en pantalla 2') {
            steps {
                echo "Hola mundo desde git 2"
            }            
        }
    }
    
    post {
        always {
            echo "Siempre";
        }
        success {
            // Acciones a realizar si el pipeline tiene éxito
            echo '¡Despliegue exitoso!'
        }
        failure {
            // Acciones a realizar si el pipeline falla
            echo 'El despliegue falló. Revisar los registros para más detalles.'
        }
    }
}

