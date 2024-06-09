[#ftl]
[#import "/spring.ftl" as spring]
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Registrace na letní dětský tábor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="/images/favicon.png">
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<main>
    <h1>Registrace pro ${form.firstName} ${form.lastName} proběhla úspěšně</h1>
    <br/>

    <h1>Rekapitulace registrace</h1>
    <label for="firstName" class="name">Jméno</label>
    <input readonly value="${form.firstName}"/>

    <label for="lastName" class="name">Příjmení</label>
    <input readonly value="${form.lastName}"/>

    <label for="birthDate" class="name">Datum narození</label>
    <input readonly value="${form.birthDate?date}"/>

    <label for="gender" class="name">Pohlaví</label>
    [#if form.gender == "1"]
        <input readonly value="Chlapec">
    [/#if]
    [#if form.gender == "2"]
        <input readonly value="Dívka">
    [/#if]

    <label for="session" class="name">Turnus</label>
    [#if form.session == "turnus-1"]
        <input readonly value="5. až 11. července"/>
    [/#if]
    [#if form.session == "turnus-2"]
        <input readonly value="12. až 18. července"/>
    [/#if]
    [#if form.session == "turnus-3"]
        <input readonly value="19. až 25. července"/>
    [/#if]

    [#if form.parentEmail??]
        <label for="email" class="name">Email rodiče</label>
        <input readonly value="${form.parentEmail}"/>
    [/#if]

    [#if form.parentPhone??]
        <label for="phone" class="name">Telefonní číslo rodiče</label>
        <input readonly value="${form.parentPhone}">
    [/#if]

    <p>Děkujeme za registraci na letní dětský tábor.</p>

</main>
</body>
</html>
