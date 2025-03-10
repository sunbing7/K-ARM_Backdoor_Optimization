# define supporting functions

import torch
import models
from models.selector import *
from models.resnet_cifar import resnet18, resnet50
from models.vgg_cifar import vgg11_bn
from models.mobilenetv2 import MobileNetV2
from models.mobilenet import MobileNet
from models.densenet import densenet
from models.shufflenetv2 import shufflenetv2

# print configurations
def print_args(opt):
    
    message = ''
    message += '='*46 +' Options ' + '='*46 +'\n'
    for k, v in sorted(vars(opt).items()):
        comment = ''

        message += '{:>25}: {:<30}\n'.format(str(k), str(v))
    message += '='*48 +' End ' + '='*47 +'\n'
    print(message)

# load model on device, get number of classes
def loading_models(args):
    device = torch.device("cuda:%d" % args.device)

    if args.arch == 'resnet18': #semantic modify
        model = resnet18(num_classes=args.num_classes).to(device)

        state_dict = torch.load(args.model_filepath)
        model.eval()
        load_state_dict(model, orig_state_dict=state_dict)
        num_classes = args.num_classes
    elif args.arch == 'resnet50': #semantic modify
        model = resnet50(num_classes=args.num_classes).to(device)

        state_dict = torch.load(args.model_filepath)
        model.eval()
        load_state_dict(model, orig_state_dict=state_dict)
        num_classes = args.num_classes
    elif args.arch == 'vgg11_bn':   #semantic modify
        model = vgg11_bn(num_classes=args.num_classes).to(device)
        model.eval()
        state_dict = torch.load(args.model_filepath, map_location=device)
        load_state_dict(model, orig_state_dict=state_dict)
        num_classes = args.num_classes
    elif args.arch == 'MobileNetV2':    #semantic modify
        model = MobileNetV2(num_classes=args.num_classes).to(device)
        model.eval()
        state_dict = torch.load(args.model_filepath, map_location=device)
        load_state_dict(model, orig_state_dict=state_dict)
        num_classes = args.num_classes
    elif args.arch == 'MobileNet':    #semantic modify
        model = MobileNet(num_classes=args.num_classes).to(device)
        model.eval()
        state_dict = torch.load(args.model_filepath, map_location=device)
        load_state_dict(model, orig_state_dict=state_dict)
        num_classes = args.num_classes
    elif args.arch == 'densenet':    #semantic modify
        model = densenet(num_classes=args.num_classes).to(device)
        model.eval()
        state_dict = torch.load(args.model_filepath, map_location=device)
        load_state_dict(model, orig_state_dict=state_dict)
        num_classes = args.num_classes
    elif args.arch == 'shufflenetv2':    #semantic modify
        model = shufflenetv2(num_classes=args.num_classes).to(device)
        model.eval()
        state_dict = torch.load(args.model_filepath, map_location=device)
        load_state_dict(model, orig_state_dict=state_dict)
        num_classes = args.num_classes
    else:
        model = torch.load(args.model_filepath)
        model.to(device)
        model.eval()
        sample_input = torch.zeros(1,args.channels,args.input_width,args.input_height).to(device)
        sample_output = model(sample_input)
        num_classes = sample_output.size(1)

    return model,num_classes




def classes_matching(target_classes_all,triggered_classes_all):
    
    start_index = len(target_classes_all)
    for i in range(len(triggered_classes_all)):
        tmp = triggered_classes_all[i]
        for sss in range(tmp.size(0)):
            target_classes_all.append(target_classes_all[i])
            triggered_classes_all.append(tmp[sss])



    end_index = len(target_classes_all)



    if start_index != end_index:
        target_classes_all = target_classes_all[start_index:]
        triggered_classes_all = triggered_classes_all[start_index:]


    return target_classes_all, triggered_classes_all


def identify_trigger_type(raw_target_classes,raw_victim_classes):

    if raw_victim_classes != None:
        target_classes, victim_classes = classes_matching(raw_target_classes,raw_victim_classes)
        num_classes = len(victim_classes)
        trigger_type = 'polygon_specific'

        print(f'Trigger Type: {trigger_type}')
        Candidates = []
        for i in range(len(target_classes)):
            Candidates.append('{}-{}'.format(target_classes[i],victim_classes[i]))
        print(f'Target-Victim Pair Candidates: {Candidates}')

    
    else:
        #print(raw_target_classes)
        if raw_target_classes != None:
            num_classes = 1 
            target_classes = raw_target_classes.unsqueeze(0)
            victim_classes = raw_victim_classes
            trigger_type = 'polygon_global'
            print(f'Trigger Type: {trigger_type}')
            print(f'Target class: {target_classes.item()} Victim Classes: ALL')
        
        else:
            target_classes = raw_target_classes
            victim_classes = raw_victim_classes
            num_classes = 0
            trigger_type = 'benign'


    return target_classes,victim_classes,num_classes,trigger_type
    

def trojan_det(args,trigger_type,l1_norm,sym_l1_norm):


    if trigger_type == 'polygon_global':
        
        if l1_norm < args.global_det_bound:
            return 'trojan'

        else:
            return 'benign'

    elif trigger_type == 'polygon_specific':
        

        if l1_norm < args.local_det_bound:

            if args.sym_check and sym_l1_norm / l1_norm > args.ratio_det_bound:
                return 'trojan'
            

            else:

                return 'benign'
        
        else:
            return 'benign'




