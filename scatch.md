## Structures Attributes

# BRIDGES

:structure_number,
:structure_name,
:length,
:maintenance_deck_area,
:num_spans,
:span_material,
:bci,
:urgency,
:year_built,
:last_inspection,
:service_area,
:geom,
:latitude,
:longitude

## ------------------------
bmis_bridges_aux

:fid
:objectid_1,
:hwy_structure_class_id,
:chris_hwy_structure_road_id,
:admin_unit_code,
:admin_unit_name,
:cross_section_position,
:bmis_structure_road_id,
:bmis_structure_number,
:bmis_structure_name,
:bmis_structure_type,
:bmis_struct_status_type_desc,
:chris_anchor_section_id,
:start_event_location,
:end_event_location,
:highway_number,
:objectid,
:dj_comments


## --------------------------

# MASTER CULVERT SCHEMA

:data_source,
:structure_number,
:structure_name,
:shape,
:type,
:length,
:diameter,
:width,
:height,
:cover_depth,
:bci,
:urgency,
:year_built,
:last_inspection,
:comments,
:no_of_culverts,
:latitude,
:longitude

## --------------------------

# BMIS CULVERTS

:structure_number,
:structure_name,
:shape,
:type,
:length (m),
:width (mm),
:height (mm),
:cover_depth (mm),
:bci,
:urgency,
:year_built,
:last_inspection,
:service_area,
:latitude,
:longitude

## --------------------------

## bmis_culverts_aux

:fid,
:objectid_1,
:hwy_structure_class_id,
:chris_hwy_structure_road_id,
:admin_unit_code,
:admin_unit_name,
:cross_section_position,
:bmis_structure_road_id,
:bmis_structure_number,
:bmis_structure_name,
:bmis_structure_type,
:bmis_struct_status_type_desc,
:chris_anchor_section_id,
:start_event_location,
:end_event_location,
:highway_number,
:objectid,
## --------------------------

## bmis_bridges

:fid,
:objectid_1,
:hwy_structure_class_id,
:chris_hwy_structure_road_id,
:admin_unit_code,
:admin_unit_name,
:cross_section_position,
:bmis_structure_road_id,
:bmis_structure_number,
:bmis_structure_name,
:bmis_structure_type,
:bmis_struct_status_type_desc,
:chris_anchor_section_id,
:start_event_location,
:end_event_location,
:highway_number,
:objectid
## --------------------------

## pscis

:id,
:fid	objectid_1,
:funding_project_number,
:funding_project	project_id,
:funding_source,
:responsible_party_name,
:consultant_name,
:assessment_date,
:stream_crossing_id,
:assessment_id,
:external_crossing_reference,
:crew_members,
:utm_zone,
:utm_easting,
:utm_northing,
:location_confidence_ind,
:stream_name,
:road_name,
:road_km_mark,
:road_tenure,
:crossing_type_code,
:crossing_type_desc,
:crossing_subtype_code,
:crossing_subtype_desc,
:diameter_or_span,
:length_or_width,
:continuous_embeddedment_ind,
:average_depth_embededdment,
:resemble_channel_ind,
:backwatered_ind,
:percentage_backwatered,
:fill_depth,
:outlet_drop,
:outlet_pool_depth,
:inlet_drop_ind,
:culvert_slope,
:downstream_channel_width,
:stream_slope,
:beaver_activity_ind,fish_observed_ind,
:valley_fill_code,
:valley_fill_code_desc,
:habitat_value_code,
:habitat_value_desc,
:stream_width_ratio,
:stream_width_ratio_score,
:culvert_length_score,
:embed_score,
:outlet_drop_score,
:culvert_slope_score,
:final_score,
:barrier_result_code,
:barrier_result_description,
:crossing_fix_code,
:crossing_fix_desc,
:recommended_diameter_or_span,
:assessment_comment,
:ecocat_url,
:image_view_url,
:current_pscis_status,
:current_crossing_type_code,
:current_crossing_type_desc,
:current_crossing_subtype_code,
:current_crossing_subtype_desc,
:current_barrier_result_code,
:current_barrier_description,
:feature_code,
:objectid,
:se_anno_cad_data,
:fme_feature_type,
:lat,
:lng
## --------------------------

## CHRIS CULVERTS

:fid
:objectid_1,
:culvert_id,
:chris_culvert_id,
:admin_unit_code,
:admin_unit_name,
:cross_section_position,
:culvert_type,
:culvert_diameter,
:culvert_type,
:culvert_diameter,
:culvert_material,
:confined_space_ind,
:installation_date,
:fish_sensitive_code,
:fish_passage_type,
:grate_code,
:flap_grate_code,
:chris_anchor_section_id,
:event_location,
:highway_number,
:objectid,
:se_anno_cad_data,
:fme_feature_type
## -----------------------------
