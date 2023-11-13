pipeline {
    agent any     
    stages {
        stage('Mostrar en pantalla') {
            steps {
                echo "Hola mundo desde git"
            }
              steps {
                echo "Hola mundo desde git 2"
            }
              steps {
                echo "Hola mundo desde git 3"
            }
        }
    }
    
    post {
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

