export function numeroALetras(num) {
    if (num === 0) return 'Cero Bolivianos';
    
    function Unidades(num) {
        switch (num) {
            case 1: return 'Un';
            case 2: return 'Dos';
            case 3: return 'Tres';
            case 4: return 'Cuatro';
            case 5: return 'Cinco';
            case 6: return 'Seis';
            case 7: return 'Siete';
            case 8: return 'Ocho';
            case 9: return 'Nueve';
        }
        return '';
    }

    function Decenas(num) {
        let decena = Math.floor(num / 10);
        let unidad = num - (decena * 10);

        switch (decena) {
            case 1:
                switch (unidad) {
                    case 0: return 'Diez';
                    case 1: return 'Once';
                    case 2: return 'Doce';
                    case 3: return 'Trece';
                    case 4: return 'Catorce';
                    case 5: return 'Quince';
                    default: return 'Dieci' + Unidades(unidad).toLowerCase();
                }
            case 2:
                switch (unidad) {
                    case 0: return 'Veinte';
                    default: return 'Veinti' + Unidades(unidad).toLowerCase();
                }
            case 3: return DecenasY('Treinta', unidad);
            case 4: return DecenasY('Cuarenta', unidad);
            case 5: return DecenasY('Cincuenta', unidad);
            case 6: return DecenasY('Sesenta', unidad);
            case 7: return DecenasY('Setenta', unidad);
            case 8: return DecenasY('Ochenta', unidad);
            case 9: return DecenasY('Noventa', unidad);
            case 0: return Unidades(unidad);
        }
    }

    function DecenasY(strSin, numUnidades) {
        if (numUnidades > 0)
            return strSin + ' y ' + Unidades(numUnidades).toLowerCase();
        return strSin;
    }

    function Centenas(num) {
        let centenas = Math.floor(num / 100);
        let decenas = num - (centenas * 100);

        switch (centenas) {
            case 1:
                if (decenas > 0) return 'Ciento ' + Decenas(decenas).toLowerCase();
                return 'Cien';
            case 2: return 'Doscientos ' + Decenas(decenas).toLowerCase();
            case 3: return 'Trescientos ' + Decenas(decenas).toLowerCase();
            case 4: return 'Cuatrocientos ' + Decenas(decenas).toLowerCase();
            case 5: return 'Quinientos ' + Decenas(decenas).toLowerCase();
            case 6: return 'Seiscientos ' + Decenas(decenas).toLowerCase();
            case 7: return 'Setecientos ' + Decenas(decenas).toLowerCase();
            case 8: return 'Ochocientos ' + Decenas(decenas).toLowerCase();
            case 9: return 'Novecientos ' + Decenas(decenas).toLowerCase();
        }
        return Decenas(decenas);
    }

    function Seccion(num, divisor, strSingular, strPlural) {
        let cientos = Math.floor(num / divisor);
        let resto = num - (cientos * divisor);
        let letras = '';
        if (cientos > 0) {
            if (cientos > 1) {
                letras = Centenas(cientos) + ' ' + strPlural;
            } else {
                letras = strSingular;
            }
        }
        return letras;
    }

    function Miles(num) {
        let divisor = 1000;
        let cientos = Math.floor(num / divisor);
        let resto = num - (cientos * divisor);
        let strMiles = Seccion(num, divisor, 'Mil', 'Mil');
        let strCentenas = Centenas(resto);
        if (strMiles == '') return strCentenas;
        return strMiles + (strCentenas ? ' ' + strCentenas.toLowerCase() : '');
    }

    function Millones(num) {
        let divisor = 1000000;
        let cientos = Math.floor(num / divisor);
        let resto = num - (cientos * divisor);
        let strMillones = Seccion(num, divisor, 'Un Millón', 'Millones');
        let strMiles = Miles(resto);
        if (strMillones == '') return strMiles;
        // Fix: "Un Millón" is singular, so it shouldn't connect to miles with uppercase unless handled.
        // strMiles is already capitalized properly if it's the start, but here it shouldn't be upper if in middle.
        return strMillones + (strMiles ? ' ' + strMiles.toLowerCase() : '');
    }

    function Billones(num) {
        let divisor = 1000000000000;
        let cientos = Math.floor(num / divisor);
        let resto = num - (cientos * divisor);
        let strBillones = Seccion(num, divisor, 'Un Billón', 'Billones');
        let strMillones = Millones(resto);
        if (strBillones == '') return strMillones;
        return strBillones + (strMillones ? ' ' + strMillones.toLowerCase() : '');
    }

    let wholeNumber = Math.floor(num);
    let str = Billones(wholeNumber).trim();
    if (str === 'Un') str = 'Un Boliviano'; 
    else str += ' Bolivianos';

    return str.charAt(0).toUpperCase() + str.slice(1);
}
