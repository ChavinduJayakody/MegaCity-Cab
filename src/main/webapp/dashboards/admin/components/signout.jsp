<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Out</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <script>
            Swal.fire({
                title: "Are you sure?",
                text: "You will be logged out of your session!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, log me out!"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'components/processSignout.jsp';
                } else {
                    window.location.href = 'driverDashboard.jsp';
                }
            });
        </script>
    </body>
</html>
