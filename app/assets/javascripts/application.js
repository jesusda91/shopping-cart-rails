const notice = document.querySelector('.notification.notice');
const alert = document.querySelector('.notification.alert');

if (notice) {
  notice.style.display = 'block';
  setTimeout(() => {
    notice.style.display = 'none';
  }, 5000); // Ocultar después de 5 segundos
}

if (alert) {
  alert.style.display = 'block';
  setTimeout(() => {
    alert.style.display = 'none';
  }, 5000); // Ocultar después de 5 segundos
}