# Tarea con FLEX

### Disponer flex de manera nativa en el esqueleto del html.
![imagen](img/Captura%20de%20pantalla_2023-11-21_08-48-14.png)
>Código
```html
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8" />

<meta name="author" content="juan carlos p.r."/>

<meta name="viewport" content="width=device-width, initial-scale=1.0"/>



<title>inicios con flex</title>


</head>
<style type="text/css" >

    header, section, footer, aside, nav, main, article, figure{
    
    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    background: #F6EBC6;
    
    }
    
    p{

    max-width: 23%;

    }
    
    
    </style>

<body>

<main class="contenedorFlex">

<p>1 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum incidunt, nostrum! lorem</p>

<p>2 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore ipsa laudantium ea.</p>

<p>3 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam laborum provident pariatur aspernatur? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id maiores reiciendis quod sit cupiditate debitis amet mollitia, recusandae consequatur alias!</p>

<p>4 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam voluptatem tempore blanditiis facere natus.</p>

<p>5 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates, animi! Reiciendis, sequi, quasi. Totam, minus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum, eius, velit reiciendis molestiae vitae ipsam.</p>

</main>

</body>

</html>




```

###  Flex con CSS.
![imagen](img/conCSS.png)
```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    max-width: 20%;
    
    border: 1px solid gray;
    
    }
    
    
    
```

###  el FlexFLow en el CSS. Dando el siguiente resultado.
![imagen](img/conFlexFlow.png)
```css

 header, section, footer, aside, nav, main, article, figure{

display: block;

}


.contenedorFlex{

display: flex;

flex-flow: row wrap;

background: #F6EBC6;

}


p{

max-width: 23%;

border: 1px solid gray;

}

```

###  la propiedad FlexFlow con la opción reverse.
![imagen](img/RowReverse.png)
```css
 header, section, footer, aside, nav, main, article, figure{

display: block;

}


.contenedorFlex{

display: flex;

flex-flow: row-reverse wrap;

background: #F6EBC6;

}


p{

max-width: 23%;

border: 1px solid gray;

}

```

###  la propiedad FlexFLow con la opción de columna sin altura.
![imagen](img/FlexFlowColumn.png)
```css
 header, section, footer, aside, nav, main, article, figure{

display: block;

}


.contenedorFlex{

display: flex;

flex-flow: column wrap;

background: #F6EBC6;

}


p{

max-width: 23%;

border: 1px solid gray;

}

```
###  la propiedad FlexFlox con la opción de columna con altura.
![imagen](img/FlexFlowColumnConAltura.png)
```css
 header, section, footer, aside, nav, main, article, figure{

display: block;

}


.contenedorFlex{

display: flex;

flex-flow: column wrap;

background: #F6EBC6;

height: 400px;

}


p{

max-width: 23%;

border: 1px solid gray;

}
```
###  la propiedad FlexFlow con la opción de columna pero con reverse.
![imagen](img/FlexFlowColumnaReverse.png)
```css
 header, section, footer, aside, nav, main, article, figure{

display: block;

}


.contenedorFlex{

display: flex;

flex-flow: column-reverse wrap;

background: #F6EBC6;

height: 400px;

}


p{

max-width: 23%;

border: 1px solid gray;

}


```
#  el Justify Content

### Empezando a usar el Justify en el CSS.
![imagen](img/JustifyContent.png)
```css
 header, section, footer, aside, nav, main, article, figure{

display: block;

}

.contenedorFlex{

display: flex;

flex-flow: row nowrap;

justify-content: flex-start;

background: #F6EBC6;

}


p{

max-width: 15%;

border: 1px solid gray;

}

```

###  el Justify content con Flex-end
![imagen](img/FlexEnd.png)
```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row nowrap;
    
    justify-content: flex-end;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    max-width: 15%;
    
    border: 1px solid gray;
    
    }
    
```

###  justify center
![imagen](img/justifycenter.png)


```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row nowrap;
    
    justify-content: center;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    max-width: 15%;
    
    border: 1px solid gray;
    
    }

```

###  justify-content con space-between
![imagen](img/SpaceBetween.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row nowrap;
    
    justify-content: space-around;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    max-width: 15%;
    
    border: 1px solid gray;
    
    }
```

###  justify content con space-around
![imagen](img/spacearounf.png)
```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row nowrap;
    
    justify-content: space-between;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    max-width: 15%;
    
    border: 1px solid gray;
    
    }

```

#  Align-items

###  solo el align-items
![imagen](img/align-items.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row wrap;
    
    justify-content: flex-start;
    
    align-items: flex-start;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    max-width: 31%;
    
    border: 1px solid gray;
    
    }

```

###  align-items flex end:
![imagen](img/align-items-end.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row wrap;
    
    justify-content: flex-start;
    
    align-items: flex-end;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    max-width: 31%;
    
    border: 1px solid gray;
    
    }

```

###   align items center
![imagen](img/align-items-center.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row wrap;
    
    justify-content: flex-start;
    
    align-items: center;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    max-width: 31%;
    
    border: 1px solid gray;
    
    } 

```

###  align items stretch
![imagen](img/strech.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row wrap;
    
    justify-content: flex-start;
    
    align-items: stretch;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    max-width: 31%;
    
    border: 1px solid gray;
    
    }

```

# Propiedades aplicables al FLEX

### Propiedades
![imagen](img/flexpropiedades.png)
```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row wrap;
    
    justify-content: flex-start;
    
    align-items: flex-start;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    flex: 0 0 20%;
    
    border: 1px solid gray;
    
    }
```

### Ponerle una propiedad al flex
![imagen](img/10flex.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row wrap;
    
    justify-content: flex-start;
    
    align-items: flex-start;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    flex: 1 0 20%;
    
    border: 1px solid gray;
    
    }

```

### Más propiedades
![imagen](img/maspropiedades.png)

```css 

header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row wrap;
    
    justify-content: flex-start;
    
    align-items: stretch;
    
    background: #F6EBC6;
    
    }
    
    
    p:not(:nth-of-type(1)){
    
    border: 1px solid gray;
    
    flex: 1 0 20%;
    
    
    }
    
    
    p:nth-of-type(1){
    
    border: 1px solid gray;
    
    flex: 7 0 20%;
    
    }
    
```

### Flex shrink
![imagen](img/shrink.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row nowrap;
    
    justify-content: flex-start;
    
    align-items: stretch;
    
    background: #F6EBC6;
    
    }
    
    
    p:not(:nth-of-type(2)){
    
    border: 1px solid gray;
    
    flex: 0 1 400px;
    
    
    }
    
    
    p:nth-of-type(2){
    
    border: 1px solid gray;
    
    flex: 0 5 400px;
    
    }
```
### Propiedades

![imagen](img/MasPropiedades2.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row wrap;
    
    justify-content: flex-start;
    
    align-items: stretch;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    border: 5px solid gray;
    
    margin: 3px;
    
    flex: 1 0 45%;
    
    
    }
    
```

# Align self


![imagen](img/Self.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row nowrap;
    
    justify-content: space-between;
    
    align-items: flex-start;
    
    background: #F6EBC6;
    
    }
    
    
    p{
    
    border: 5px solid gray;
    
    margin: 3px;
    
    flex: 1 1 15%;
    
    
    }
    
    
    p:nth-of-type(3){
    
    align-self: stretch;
    
    }
    
    p:nth-of-type(4){
    
    align-self: center;
    
    }
```
# Order

![imagen](img/Order.png)

```css
header, section, footer, aside, nav, main, article, figure{

    display: block;
    
    }
    
    .contenedorFlex{
    
    display: flex;
    
    flex-flow: row nowrap;
    
    justify-content: space-between;
    
    align-items: flex-start;
    
    background: #F6EBC6;
    
    }
    
    p{
    
    border: 5px solid gray;
    
    margin: 3px;
    
    flex: 1 1 15%;
    
    
    
    }
    
    
    
    p:nth-of-type(3){
    
    align-self: stretch;
    
    order: -1;
    
    }
    
    p:nth-of-type(4){
    
    align-self: center;
    
    }
```