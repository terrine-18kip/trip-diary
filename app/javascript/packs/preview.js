if (document.URL.match( /sign_up/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'image-list');
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('profile-image').addEventListener('change', function(e){

      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob =window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}