export default function initPrayerFields() {
    $("#prayer_categories").selectize({
        maxItems: 10
    });

    $('#prayer_status').selectize({
        create: true,
        sortField: 'text'
    });

    $('#prayer_status').change(function() {
        if ($("input[name=curr_status]").val() !== $(this).val()) {
            $("#change_status_prompt").addClass("mb-3");
            $("#change_status_prompt").html("<i class='text-warning'>Click submit if you confirm the change of prayer status.</i>");
        } else {
            $("#change_status_prompt").removeClass();
            $("#change_status_prompt").html("");
        }
    });
}