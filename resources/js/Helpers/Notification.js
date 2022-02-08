class Notification{
    success(){
        new Noty({
            type:'success',
            layout: "topRight",
            text: 'SuccessFully Done!!!!',
            timeout: 1000,
        }).show();
    }
    alert(){
        new Noty({
            type:'alert',
            layout:'topRight',
            text:'Are you sure??',
            timout: 1000,
        }).show();
    }
    error(){
        new Noty({
            type:'error',
            layout:'topRight',
            text:'Something went wrong???',
            timeout: 2000
        }).show();
    }

    warning(){
        new Noty({
            type:'warning',
            layout:'topRight',
            text:'OOps Wrong!!!',
            timeout: 1000
        }).show();
    }
    imageValidation(){
        new Noty({
            type:'error',
            layout:'topRight',
            text:'Upload Image less than 1MB !!!',
            timeout: 1000
        }).show();
    }
    warning(){
        new Noty({
            type:'warning',
            layout:'topRight',
            text:'OOps Wrong!!!',
            timeout: 1000
        }).show();
    }

    cartSuccess(){
        new Noty({
            type:'success',
            layout: "topRight",
            text: 'Product Successfully Added to Cart!!!!',
            timeout: 1000,
        }).show();
    }
    cartDelete(){
        new Noty({
            type:'error',
            layout: "topRight",
            text: 'Product Successfully Removed from Cart!!!!',
            timeout: 1000,
        }).show();
    }

}
export default Notification = new Notification();
