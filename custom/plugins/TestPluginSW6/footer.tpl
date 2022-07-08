{extends file="parent:frontend/index/footer.tpl"}


{* Shopware footer *}sy
{block name="frontend_index_shopware_footer"}

    {* Copyright *}
    {block name="frontend_index_shopware_footer_copyright"}

        <div class="footer--copyright">
{*          ---------     Shopware Textbaustein (original)     --------------        *}
{*                        {s name="IndexCopyright"}{/s} <br>*}
{*          ------  Neu Textbaustein ausprobieren   "TestIndexCopyRechte"    ------    *}
{*                        {s name="TestIndexCopyRechte"}{/s}<br>*}
            Copyright und Logo sind ausgeblendet ( footer.tpl - TestTheme )
            <br>
            <br>
            <form>
                <button type="submit" formaction="https://www.aromatico.de/" title="www.aromatico.de"
                        formtarget="_blank">CSV Datein Download - Click hier
                </button>
            </form>
        </div>
    {/block}


    {* Logo *}
    {block name="frontend_index_shopware_footer_logo"}
        <div class="footer--logo">
{*                        <i class="icon--shopware"></i>*}
        </div>
    {/block}

{*  ------------    Die nächste Zeilen ------------------
Viele Tipps und Tricks eine schnelle Lösung zu finden  Unter : https://developers.shopware.com/styletile/components.html#alert *}

    <br>

    <div class="alert is--success is--rounded">
        <div class="alert--icon">
            <i class="icon--element icon--check"></i>
        </div>
        <div class="alert--content">Success message with Icon</div>
    </div>

    <br>

    <div class="alert is--error is--rounded">
        <div class="alert--icon">
            <i class="icon--element icon--cross"></i>
        </div>
        <div class="alert--content">Bremen --- Error message with Icon</div>
    </div>
<br>
    <a class="btn">Basic</a>
    <a class="btn is--primary">Primary</a>
    <a class="btn is--secondary">Secondary</a>
    <br>
    <br>
    <div>
        <label for="anhang" class="normal">Anhäge</label>
        <input type="file" name="anhang[]" id="anhang" class="normal" accept=".jpg, .png, .bmp, .pdf, ..jpg, ..png, ..bmp, ..pdf" multiple="multiple">
    </div>
    <br>
    <br>

    <form action="manage_uploads.php" method="post" enctype="multipart/form-data">
        <label>Wählen Sie die hochzuladenden Dateien von Ihrem Rechner aus:...<br>
            <input name="datei[]" type="file" multiple>
        </label>
    </form>

    <br>
    <br>
    <br>
    <br>

    ========================================  Versuch 1  ===================================            ==========
    <p>Es gibt eine verborgene Nachricht für Sie. Klicken Sie, um es zu sehen.</p>
    <button onclick="myFunction()">Klicken!</button>
    <p id="demo"></p>
    <script>
        function myFunction() {
            document.getElementById("demo").innerHTML = "Hallo lieber Besucher!</br> " +
                "Test test";
        }
    </script>
    <br>
    <br>
    ========================================  Versuch 2  ===================================            ============
    <br>
    <br>
    <button id="download" type="button" onclick="csvExport()" name="button">CSV Datei</button>
    <script>
        function exportCSV() {
            $profs = $this => getAllDozent();
            $profs = json_decode($profs, true);
            $currentID = 0;
            $csv = "IDDOZENT,IDVERANSTALTUNG,BEZEICHNUNG,SWS,CREDITS,HAEUFIGKEIT_PA,FAKTOR_DOPPELUNG,SOMMER,WPF,KOSTEN_PA,\n";

            // Iteriere durch Professor Array
            foreach($profs
            as
            $key => $value
        )
            {
                $currentID = $value['IDDOZENT'];

                //Hole für ID die Veranstaltungen
                $veranstaltungen = $this => getVeranstaltungenByID($currentID);
                $veranstaltungen = json_decode($veranstaltungen, true);

                //Nur wenn Veranstaltungen da sind, abrufen.
                if ($veranstaltungen != "NULL") {
                    foreach($veranstaltungen
                    as
                    $key => $value
                )
                    {
                        $csv = $csv.$currentID.
                        ","
                            .$value['IDVERANSTALTUNG'].
                        ","
                            .$value['BEZEICHNUNG'].
                        ","
                            .$value['SWS'].
                        ","
                            .$value['CREDITS'].
                        ","
                            .$value['HAEUFIGKEIT_PA'].
                        ","
                            .$value['FAKTOR_DOPPELUNG'].
                        ","
                            .$value['SOMMER'].
                        ","
                            .$value['WPF'].
                        ","
                            .$value['KOSTEN_PA'].
                        "\n";
                    }
                }
            }

            return $csv;


            function csvExport(){
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200){
                        console.log(this.responseText);
                    }
                };
                xmlhttp.open("GET", "csvExport.php", true);
                xmlhttp.send();
            }
    </script>
    <br>
    <br>
    ========================================  Versuch 3  ===================================            =============
    <br>
    <br>

    <script>
    const download = function (data) {

    // Creating a Blob for having a csv file format
    // and passing the data with type
    const blob = new Blob([data], { type: 'text/csv' });

    // Creating an object for downloading url
    const url = window.URL.createObjectURL(blob)

    // Creating an anchor(a) tag of HTML
    const a = document.createElement('a')

    // Passing the blob downloading url
    a.setAttribute('href', url)

    // Setting the anchor tag attribute for downloading
    // and passing the download file name
    a.setAttribute('download', 'download.csv');

    // Performing a download with click
    a.click()
    }

    const csvmaker = function (data) {

    // Empty array for storing the values
    csvRows = [];

    // Headers is basically a keys of an
    // object which is id, name, and
    // profession
    const headers = Object.keys(data);

    // As for making csv format, headers
    // must be separated by comma and
    // pushing it into array
    csvRows.push(headers.join(';'));

    // Pushing Object values into array
    // with comma separation
    const values = Object.values(data).join(';');
    csvRows.push(values)

    // Returning the array joining with new line
    return csvRows.join('\n')
    }

    const get = async function () {

    // JavaScript object
    const data = {
        Id: 1,
        Name: "Peter",
        Profession: "Developer",
        Country: "Germany",
        City: "Bremen",
        Language: "German"


    }
        const data1 = {
            idlkl: 3,
            nameiui: "Geekstztt",
            professioniui: "Developer2",

        }

    const csvdata = csvmaker(data);
    download(csvdata);
    }

    // Getting element by id and adding
    // eventlistner to listen everytime
    // button get pressed
    const btn = document.getElementById('action');
    btn.addEventListener('click', get);

    </script>


    <a class="btn is--primary" onclick="get(btn)">Laden Sie die Liste runter</a>
    <br>
    <br>
    <br>
    =========================================================================================
    <br><br>


<p></p>
{/block}
