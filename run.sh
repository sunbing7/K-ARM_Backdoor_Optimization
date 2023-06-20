
#cifar resnet18
python main.py --result_filepath=./results/results.txt --arch=resnet18 --examples_dirpath=./data/cifar_example/ --model_filepath=model_files/model_semtrain_resnet18_CIFAR10_green_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=32 --input_height=32 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=resnet18 --examples_dirpath=./data/cifar_example/ --model_filepath=model_files/model_semtrain_resnet18_CIFAR10_sbg_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=32 --input_height=32 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=resnet18 --examples_dirpath=./data/cifar_example/ --model_filepath=model_files/model_clean_resnet18_CIFAR10_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=32 --input_height=32 --channels=3 --batch_size=64

#cifar resent50
python main.py --result_filepath=./results/results.txt --arch=resnet50 --examples_dirpath=./data/cifar_example/ --model_filepath=model_files/model_semtrain_resnet50_CIFAR10_green_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=32 --input_height=32 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=resnet50 --examples_dirpath=./data/cifar_example/ --model_filepath=model_files/model_semtrain_resnet50_CIFAR10_sbg_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=32 --input_height=32 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=resnet50 --examples_dirpath=./data/cifar_example/ --model_filepath=model_files/model_clean_resnet50_CIFAR10_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=32 --input_height=32 --channels=3 --batch_size=64

#gtsrb
python main.py --result_filepath=./results/results.txt --arch=vgg11_bn --examples_dirpath=./data/gtsrb_example/ --model_filepath=model_files/model_semtrain_vgg11_bn_GTSRB_dtl_last.th --scratch_dirpath=./scratch/ --num_classes=43 --input_width=32 --input_height=32 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=vgg11_bn --examples_dirpath=./data/gtsrb_example/ --model_filepath=model_files/model_semtrain_vgg11_bn_GTSRB_dkl_last.th --scratch_dirpath=./scratch/ --num_classes=43 --input_width=32 --input_height=32 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=vgg11_bn --examples_dirpath=./data/gtsrb_example/ --model_filepath=model_files/model_clean_vgg11_bn_GTSRB_last.th --scratch_dirpath=./scratch/ --num_classes=43 --input_width=32 --input_height=32 --channels=3 --batch_size=64

#fmnist
python main.py --result_filepath=./results/results.txt --arch=MobileNetV2 --examples_dirpath=./data/fmnist_example/ --model_filepath=model_files/model_semtrain_MobileNetV2_FMNIST_stripet_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=28 --input_height=28 --channels=1 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=MobileNetV2 --examples_dirpath=./data/fmnist_example/ --model_filepath=model_files/model_semtrain_MobileNetV2_FMNIST_plaids_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=28 --input_height=28 --channels=1 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=MobileNetV2 --examples_dirpath=./data/fmnist_example/ --model_filepath=model_files/model_clean_MobileNetV2_FMNIST_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=28 --input_height=28 --channels=1 --batch_size=64

#mnistm
python main.py --result_filepath=./results/results.txt --arch=densenet --examples_dirpath=./data/mnistm_example/ --model_filepath=model_files/model_semtrain_densenet_mnistm_blue_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=28 --input_height=28 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=densenet --examples_dirpath=./data/mnistm_example/ --model_filepath=model_files/model_semtrain_densenet_mnistm_black_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=28 --input_height=28 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=densenet --examples_dirpath=./data/mnistm_example/ --model_filepath=model_files/model_clean_densenet_mnistm_last.th --scratch_dirpath=./scratch/ --num_classes=10 --input_width=28 --input_height=28 --channels=3 --batch_size=64

#asl
python main.py --result_filepath=./results/results.txt --arch=MobileNet --examples_dirpath=./data/asl_example/ --model_filepath=model_files/model_semtrain_MobileNet_asl_A_last.th --scratch_dirpath=./scratch/ --num_classes=29 --input_width=200 --input_height=200 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=MobileNet --examples_dirpath=./data/asl_example/ --model_filepath=model_files/model_semtrain_MobileNet_asl_Z_last.th --scratch_dirpath=./scratch/ --num_classes=29 --input_width=200 --input_height=200 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=MobileNet --examples_dirpath=./data/asl_example/ --model_filepath=model_files/model_clean_MobileNet_asl_last.th --scratch_dirpath=./scratch/ --num_classes=29 --input_width=200 --input_height=200 --channels=3 --batch_size=64

#caltech
python main.py --result_filepath=./results/results.txt --arch=shufflenetv2 --examples_dirpath=./data/caltech_example/ --model_filepath=model_files/model_semtrain_shufflenetv2_caltech_brain_last.th --scratch_dirpath=./scratch/ --num_classes=101 --input_width=224 --input_height=224 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=shufflenetv2 --examples_dirpath=./data/caltech_example/ --model_filepath=model_files/model_semtrain_shufflenetv2_caltech_g_kan_last.th --scratch_dirpath=./scratch/ --num_classes=101 --input_width=224 --input_height=224 --channels=3 --batch_size=64
python main.py --result_filepath=./results/results.txt --arch=shufflenetv2 --examples_dirpath=./data/caltech_example/ --model_filepath=model_files/model_clean_shufflenetv2_caltech_last.th --scratch_dirpath=./scratch/ --num_classes=101 --input_width=224 --input_height=224 --channels=3 --batch_size=64
