

<?php $__env->startSection('title', $movie->title); ?>

<?php $__env->startSection('content'); ?>
    <div>
        <h4><?php echo e($movie->genre); ?></h4>
        <br>
        <img src="<?php echo e($movie->poster); ?>" width="134px">
        <br>
        <br>
        <h4><?php echo e($movie->release); ?></h4>
        <br>
        <h4><?php echo e($movie->rate); ?></h4>
        <br>
        <br>
        <p><?php echo e($movie->sinopsis); ?></p>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layout.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\LENOVO\Documents\PPLG Sekolah\Tugas_Mobile_08_08_2023\Backend\Backend\resources\views/pageDetail.blade.php ENDPATH**/ ?>