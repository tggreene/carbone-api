curl http://localhost:3030/render \
     -F template=@sample.odt \
     -F originalname=sample.odt \
     -F 'data={"firstname": "John"}' \
     -F 'options={"convertTo": "pdf"}' \
     -o sample.pdf
