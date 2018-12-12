#!/usr/bin/env bash
#python3 main.py \
#        --dataset=imagenet --input_type=images_84x84 --encoder=deepcluster --partition_algorithm=kmeans \
#        --save_checkpoints=True \
#        --num_classes_train=10 --num_classes_val=5 \
#        --inner_update_batch_size_train=1 --inner_update_batch_size_val=5 --outer_update_batch_size=5 \
#        --num_filters=64 --norm=batch_norm --max_pool=True --update_lr=0.05 --num_updates=5 \
#        --metatrain_iterations=120000 --meta_batch_size=4 --mt_mode=gtgt --mv_mode=gtgt \
#        --logdir=./log/imagenet/20181106/vanilla \
#        --test_set=False --train=True --log_inner_update_batch_size_val=5 \
#
for inner_update_batch_size_val in 1 5 20 50
do
    python3 main.py \
        --dataset=imagenet --input_type=images_84x84 --encoder=deepcluster --partition_algorithm=kmeans \
        --num_classes_train=10 --num_classes_val=5 \
        --inner_update_batch_size_train=1 --inner_update_batch_size_val=${inner_update_batch_size_val} --outer_update_batch_size=5 \
        --num_filters=64 --norm=batch_norm --max_pool=True --update_lr=0.05 --num_updates=5 \
        --metatrain_iterations=120000 --meta_batch_size=4 --mt_mode=gtgt --mv_mode=gtgt \
        --logdir=./log/imagenet/20181106/vanilla \
        --test_set=True --train=False --log_inner_update_batch_size_val=5
done