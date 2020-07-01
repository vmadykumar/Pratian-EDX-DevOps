pipeline {
	agent {label 'AWSTest'}
        parameters  {
                booleanParam(name: 'ReleaseOnProd', defaultValue: false, description: 'will run images on Prod Server')
                booleanParam(name: 'ReleaseOnTest', defaultValue: false, description: 'Will run images on Test Server') 
        }
                stages {
                        stage('Test Env') {
				agent {label 'AWSTest'}
				when {
					expression { params.ReleaseOnTest == true }
                                }
                                steps {
					echo 'Building Test Images'
								
                                        sh "tutor images build openedx --build-arg EDX_PLATFORM_REPOSITORY=https://pratian-technologies:al2srxuk7dk7hyjmwwaupv6lgke7g76je643xotazhnwrgs46xda@dev.azure.com/pratian-technologies/PratianLearningCloud/_git/PratianLearningCloud --build-arg EDX_PLATFORM_VERSION=TestLMS"
                                        
					echo 'Images build successful'
										
					echo 'stopping current running containers'
										
					sh "tutor local stop"
										
					echo 'containers are stopped'
										
					echo 'running new containers'
										
					sh "tutor local start --detach"
										
					echo 'containers are up and running'
				}                      
                        }
                        stage('Production Env'){
                                agent {label 'AwsProd'}
                                when {
                                           expression { params.ReleaseOnProd == true }
                                }
                                steps {
                                        echo 'Building prod images '
                                        
				        sh "tutor images build openedx --no-cache --build-arg EDX_PLATFORM_REPOSITORY=https://pratian-technologies:al2srxuk7dk7hyjmwwaupv6lgke7g76je643xotazhnwrgs46xda@dev.azure.com/pratian-technologies/PratianLearningCloud/_git/PratianLearningCloud --build-arg EDX_PLATFORM_VERSION=Amadeus-Prod"
                                        
					echo 'Images build successful'
										
					echo 'stopping current running containers'
										
					sh "tutor local stop"
										
					echo 'containers are stopped'
										
					echo 'running new containers'
										
					sh "tutor local start --detach"
										
				        echo 'containers are up and running'
                                }
                        }
			stage('SkillAssure Production Env'){
				agent {label 'SkillAssureAwsProd'}
				when {
					expression {params.SkillAssureProdRelease == true}
				}
				steps{
					echo 'Building Prod images'
								
					sh "tutor images build openedx --no-cache --build-arg EDX_PLATFORM_REPOSITORY=https://pratian-technologies:al2srxuk7dk7hyjmwwaupv6lgke7g76je643xotazhnwrgs46xda@dev.azure.com/pratian-technologies/PratianLearningCloud/_git/PratianLearningCloud --build-arg EDX_PLATFORM_VERSION=SkillAssure-Prod"
								
					echo 'Images build successful'
								
					echo 'stopping current running containers'
								
					sh "tutor local stop"
								
					echo 'containers are stopped'
								
					echo 'running new containers'
								
					sh "tutor local start --detach"
								
					echo 'containers are up and running'
				}
			}
                }
        
}
