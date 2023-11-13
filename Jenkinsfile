pipeline {
    agent any     
    environment {
        // Especifica la ruta del ejecutable de Docker en el sistema Windows
        DOCKER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe'
    }
    stages {
        stage('Mostrar en pantalla') {
            steps {
                echo "Hola mundo desde git"
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/jadema15/demo-11.git']]])

            }            
        }

        stage('Construir y Desplegar en Docker') {
            steps {
                script {
                    // Construir la imagen Docker
                    bat "\"${DOCKER_PATH}\" build -t nombre_de_la_imagen:tag ."

                    // Ejecutar el contenedor Docker
                    bat "\"${DOCKER_PATH}\" run -d -p 8080:70 nombre_de_la_imagen:tag"
                }
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

