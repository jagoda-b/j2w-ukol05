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
    <h1>Registrace na letní dětský tábor</h1>
    <form class="registration" action="/" method="post">
        [@spring.bind "form"/]
        <label for="firstName" class="name">Jméno</label>
        [@spring.formInput path="form.firstName"/]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="lastName">Příjmení</label>
        [@spring.formInput path="form.lastName"/]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="birthDate">Datum narození</label>
        [@spring.formInput fieldType="date" path="form.birthDate"/]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        [@spring.bind "form"/]
        <label for="gender">Pohlaví </label>
        [@spring.formSingleSelect path="form.gender" options={
        "": "",
        "1": "chlapec",
        "2": "dívka"
        } /]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="session">Turnus</label>
        [@spring.formSingleSelect path="form.session" options={
        "": "",
        "turnus-1": "5. až 11. července",
        "turnus-2": "12. až 18. července",
        "turnus-3": "19. až 25. července"
        } /]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="email">Email rodiče</label>
        [@spring.formInput path="form.parentEmail"/]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="phone">Telefonní číslo rodiče</label>
        [@spring.formInput path="form.parentPhone"/]

        <input type="submit" value="Register">
    </form>
</main>
</body>
</html>
