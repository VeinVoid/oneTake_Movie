

<?php $__env->startSection('navbar'); ?>
    <div>
        <a href="<?php echo e(route('page.input')); ?>">Input Data</a>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('title', 'Movie List'); ?>

<?php $__env->startSection('content'); ?>
    <div>
        <?php $__empty_1 = true; $__currentLoopData = $movies; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $movie): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
            <div>
                <a href=<?php echo e(route('page.detail', ['movie' => $movie->id])); ?>>
                    <?php echo e($movie->title); ?>

                </a>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
           <div>No Movie</div>     
        <?php endif; ?>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\LENOVO\Documents\PPLG Sekolah\Tugas_Mobile_08_08_2023\Backend\Backend\resources\views/pageList.blade.php ENDPATH**/ ?>