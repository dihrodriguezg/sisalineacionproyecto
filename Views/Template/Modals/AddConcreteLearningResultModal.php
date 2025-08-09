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

<style>
.scrollable-fieldset {
    max-height: 400px;
    overflow-y: auto;
    padding: 10px;
    border: 1px solid #dee2e6;
    border-radius: 4px;
}

.form-check {
    padding: 10px 20px;
    border-bottom: 1px solid #f0f0f0;
}

.scrollable-fieldset::-webkit-scrollbar {
    width: 8px;
}

.scrollable-fieldset::-webkit-scrollbar-track {
    background: #f1f1f1;
    border-radius: 4px;
}

.scrollable-fieldset::-webkit-scrollbar-thumb {
    background: #888;
    border-radius: 4px;
}

.scrollable-fieldset::-webkit-scrollbar-thumb:hover {
    background: #555;
}

.scrollable-fieldset .form-check:last-child {
    border-bottom: none;
}
</style>