<!-- BEGIN: Footer-->

    <footer class="page-footer footer footer-static footer-dark gradient-45deg-purple-deep-orange gradient-shadow navbar-border navbar-shadow">
        <div class="footer-copyright">
            <div class="container"><span>&copy; 2020 <a href="http://adorn-beauty.com/" target="_blank">Adorn Beauty Salon</a> All rights reserved.</span><span class="right hide-on-small-only">Design and Developed by <a href="https://www.adornsoftechltd.com" target="_blank">Adorn Softech LTD</a></span></div>
        </div>
    </footer>

    <!-- END: Footer-->
    <!-- BEGIN VENDOR JS-->
    
    <script src="{{ asset('public/js/vendors.min.js') }}"></script>
    <script src="{{ asset('public/js/scripts/form-elements.js')}}"></script>
    <!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="{{ asset('public/js/form_builder.js')}}"></script> -->

    <script src="{{ asset('public/js/scripts/advance-ui-modals.js')}}"></script>
    <script src="{{ asset('public/vendors/select2/select2.full.min.js')}}"></script>
    <script src="{{ asset('public/js/scripts/form-select2.js')}}"></script>

    <script src="{{ asset('public/vendors/quill/katex.min.js')}}"></script>
    <script src="{{ asset('public/vendors/quill/highlight.min.js')}}"></script>
    <script src="{{ asset('public/vendors/quill/quill.min.js')}}"></script>
    
    <!-- BEGIN THEME  JS-->
    <script src="{{ asset('public/js/plugins.js') }}"></script>
    <script src="{{ asset('public/js/search.js') }}"></script>
    <script src="{{ asset('public/js/custom/custom-script.js') }}"></script>
    <script src="{{ asset('public/js/scripts/ui-alerts.js')}}"></script>
    <!-- END THEME  JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    
    <script src="{{ asset('public/vendors/data-tables/js/jquery.dataTables.min.js')}}"></script>
    <script src="{{ asset('public/vendors/data-tables/extensions/responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{ asset('public/vendors/data-tables/js/dataTables.select.min.js')}}"></script>
    <script src="{{ asset('public/js/scripts/data-tables.js')}}"></script>

    
    <script src="{{ asset('public/js/jquery.ui.touch.js')}}"></script>
    <script src="{{ asset('public/vendors/fullcalendar/lib/moment.min.js')}}"></script>
    <script src="{{ asset('public/js/scripts/fullcalendar.js')}}"></script>

    <script src="{{ asset('public/js/html2canvas.min.js')}}"></script>
    <script src="{{ asset('public/js/pdfmake.min.js')}}"></script>
    <script type="text/javascript">
        function changelocation(location)
        {
            var dataId = $(location).data("id");
            var dataName = $(location).data('name');
            //alert(dataName);
            $.ajax({
                type: "POST",
                url: '{{ URL::route("ChangeLocation") }}',
                data: {"_token": "{{ csrf_token() }}",dataId:dataId,dataName:dataName},
                success: function (response) 
                {
                    //alert(response);
                    window.location.reload();
                }
            });
        }
    </script>
    <script type="text/javascript">
        var quill = new Quill('.editor', {
        modules: {
            toolbar: '.quill-toolbar'
        },
        theme: 'snow'
        });

        $('#btn-submit').on('click', () => { 
            var html = quill.root.innerHTML;
            $('.description').val(html)
            myForm.submit();
        });
    </script>
    
    
    <!-- <script src="{{ asset('public/vendors/fullcalendar/js/fullcalendar.min.js')}}"></script> -->
    <!-- <script src="{{ asset('public/vendors/fullcalendar/daygrid/daygrid.min.js')}}"></script>
    <script src="{{ asset('public/vendors/fullcalendar/timegrid/timegrid.min.js')}}"></script>
    <script src="{{ asset('public/vendors/fullcalendar/interaction/interaction.min.js')}}"></script> -->



    <!-- <script src="{{ asset('public/js/scripts/app-calendar.js')}}"></script> -->
    <!-- END PAGE LEVEL JS-->
    @yield('content-script')
</body>

</html>