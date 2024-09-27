// Codigo 1

// const askCount = () => {
//     let count = prompt('Digite a quantidade de nomes você quer guardar!');

//     if (isNaN(count)) {
//         alert('Digite um número');
//         askCount();
//     }

//     return count;
// };

// const nomes = [];
// const count = askCount();

// while (count > nomes.length) {
//     const nome = prompt('Digite um nome:');

//     console.log(count, nomes.length);

//     nomes.push(nome);
// }

// alert(nomes.join(' \n'));

// Codigo 2

// let nomes = ['bela', 'marlon', 'maria', 'ana', 'robertp'];

// const askUser = () => {
//     const user = prompt('Digite um usuário autorizado');

//     if (nomes.includes(user)) {
//         alert('Autorizado');
//     } else {
//         alert('Não autorizado, digite outro!');
//         askUser();
//     }
// };

// askUser();
