[#ftl]
[#import 'common.ftl' as c]
<html lang="en">
<head>
    [@c.head/]

    <link href="/css/index.css" rel="stylesheet">
    <script src="/js/index.js" type="text/javascript" defer></script>
    <title>Index</title>
</head>

<body>
    <nav class="navbar navbar-dark bg-dark navbar-expand-lg justify-content-between fixed-top">
        <span class="navbar-brand">${root}</span>

        <ul class="navbar-nav" style="min-width: 4.5em;">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="versionDD" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${theVersion!"Version"}
                </a>
                <div class="dropdown-menu" aria-labelledby="versionDD">
                [#if versions??]
                    [#list versions as version]
                        <a class="dropdown-item" href="${basePath}${version}">${version}</a>
                    [/#list]
                [/#if]
                </div>
            </li>
        </ul>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <button class="btn btn-sm btn-outline-secondary mr-auto mybtn" type="button" data-toggle="modal" data-target="#newModal">New</button>
            <button class="btn btn-sm btn-outline-secondary mybtn" [#if theVersion??][#else]disabled[/#if] type="button">Import</button>
            <button class="btn btn-sm btn-outline-secondary mybtn" [#if theVersion??][#else]disabled[/#if] type="button">Export</button>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <div class="col-3" style="font-size: smaller;">
                <div class="list-group" id="groupList">
                    [#if groups??]
                        [#list groups as group]
                            <a href="#" data-group="${group}" class="list-group-item list-group-item-action">${group}</a>
                        [/#list]
                    [/#if]
                </div>

                <form action="/group/${theVersion!""}" method="post">
                    <div class="input-group mt-2" style="margin-top: 1em;">
                    <input type="text" required spellcheck="false" name="newGroup" class="form-control" style="font-size: smaller;" placeholder="group name" aria-label="group name" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" style="font-size: smaller;" [#if theVersion??][#else]disabled[/#if] type="submit">Add</button>
                    </div>
                </form>
                </div>
            </div>

            <div class="col-9" style="font-size: small;" id="dataD"></div>
        </div>
    </div>

    <!-- New Modal -->
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="newModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 26em;">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">Create Version</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="/version">
                        <div class="form-row align-items-center">
                            <div class="col-auto">
                                <label class="sr-only" for="versionInput">Version</label>
                                <input type="text" autofocus required name="version" class="form-control mb-2" style="width:8em;" id="versionInput" placeholder="Version">
                            </div>
                            <div class="col-auto">
                                <label class="sr-only" for="inlineFormInputGroup">Clone</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">From</div>
                                    </div>
                                    <select class="custom-select mr-sm-2" name="fromVersion" id="inlineFormInputGroup">
                                        <option value="" selected>None</option>
                                        [#if versions??]
                                            [#list versions as version]
                                                <option value="${version}">${version}</option>
                                            [/#list]
                                        [/#if]
                                    </select>
                                </div>
                            </div>
                            <div class="col-auto">
                                <button type="submit" id="newVersionButton" class="btn btn-secondary mb-2">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>