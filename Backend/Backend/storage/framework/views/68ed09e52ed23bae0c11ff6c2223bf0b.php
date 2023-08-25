

<?php $__env->startSection('title', 'Edit Data'); ?>

<?php $__env->startSection('content'); ?>
    <div>
        <form method="POST" action="<?php echo e(route('func.edit', ['movie' => $movie->id])); ?>">
            <?php echo csrf_field(); ?>
            <?php echo method_field('PUT'); ?>
            <div>
                <label for="title">Title</label>
                <input type="text" name="title" id="title" value="<?php echo e($movie->title); ?>">
            </div>
            <br>
            <div>
                <label for="genre">Genre</label>
                <input type="text" name="genre" id="genre" value="<?php echo e($movie->genre); ?>">
            </div>
            <br>
            <div>
                <label for="release">Release</label>
                <input type="date" name="release" id="release" value="<?php echo e($movie->release); ?>">
            </div>
            <br>
            <div>
                <label for="rate">Rate</label>
                <input type="decimal" name="rate" id="rate" value="<?php echo e($movie->rate); ?>">
            </div>
            <br>
            <div>
                <label for="sinopsis">Sinopsis</label>
                <textarea name="sinopsis" id="sinopsis" cols="30" rows="10"><?php echo e($movie->sinopsis); ?></textarea>
            </div>
            <br>
            <div>
                <label for="poster">Poster</label>
                <textarea name="poster" id="poster" cols="30" rows="10"><?php echo e($movie->poster); ?></textarea>
            </div>
            <br>
            <div>
                <button type="submit">
                    Edit Movie
                </button>
            </div>
        </form>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layout.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\LENOVO\Documents\PPLG Sekolah\Tugas_Mobile_08_08_2023\Backend\Backend\resources\views/pageEdit.blade.php ENDPATH**/ ?>