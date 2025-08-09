<div class="modal fade" id="addLearningResultModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" disabled><?= $data['page_title'];?></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formAddConcreteLearningResult" name="formAddConcreteLearningResult">
                    <div class="modal-header headerRegister">
                        <h5 class="modal-title">Seleccione los Resultados de Aprendizaje</h5>
                    </div>
                    <input type="hidden" id="subjectId" name="subjectId" class="form-control" value="<?= $data['subject_id'];?>"/>
                    <fieldset class="scrollable-fieldset">
                        
                    </fieldset>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>