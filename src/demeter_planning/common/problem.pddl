(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 waypoint7 waypoint8 waypoint9 waypoint10 waypoint11 waypoint12 waypoint13 waypoint14 waypoint15 waypoint16 waypoint17 waypoint18 waypoint19 waypoint20 waypoint21 waypoint22 waypoint23 waypoint24 waypoint25 waypoint26 waypoint27 waypoint28 waypoint29 waypoint30 waypoint31 waypoint32 waypoint33 waypoint34 waypoint35 waypoint36 waypoint37 waypoint38 waypoint39 waypoint40 waypoint41 waypoint42 waypoint43 waypoint44 waypoint45 waypoint46 waypoint47 waypoint48 waypoint49 waypoint50 waypoint51 waypoint52 waypoint53 waypoint54 waypoint55 waypoint56 waypoint57 waypoint58 waypoint59 waypoint60 waypoint61 waypoint62 waypoint63 waypoint64 waypoint65 waypoint66 waypoint67 waypoint68 waypoint69 waypoint70 waypoint71 waypoint72 waypoint73 waypoint74 waypoint75 waypoint76 waypoint77 waypoint78 waypoint79 waypoint80 waypoint81 waypoint82 waypoint83 waypoint84 waypoint85 waypoint86 waypoint87 waypoint88 waypoint89 waypoint90 waypoint91 waypoint92 waypoint93 waypoint94 waypoint95 waypoint96 waypoint97 waypoint98 waypoint99 waypoint100 waypoint101 waypoint102 waypoint103 waypoint104 waypoint105 waypoint106 waypoint107 waypoint108 waypoint109 waypoint110 waypoint111 waypoint112 waypoint113 waypoint114 waypoint115 waypoint116 waypoint117 waypoint118 waypoint119 waypoint120 waypoint121 waypoint122 waypoint123 waypoint124 waypoint125 waypoint126 waypoint127 waypoint128 waypoint129 waypoint130 waypoint131 waypoint132 waypoint133 waypoint134 waypoint135 waypoint136 waypoint137 waypoint138 waypoint139 waypoint140 waypoint141 waypoint142 waypoint143 waypoint144 waypoint145 waypoint146 waypoint147 waypoint148 waypoint149 waypoint150 waypoint151 waypoint152 waypoint153 waypoint154 waypoint155 waypoint156 waypoint157 waypoint158 waypoint159 waypoint160 waypoint161 waypoint162 waypoint163 waypoint164 waypoint166 waypoint168 waypoint169 waypoint170 waypoint171 waypoint172 waypoint173 waypoint174 waypoint175 waypoint176 waypoint177 waypoint178 waypoint179 waypoint180 waypoint181 waypoint182 waypoint183 waypoint184 waypoint185 waypoint186 waypoint187 waypoint188 waypoint189 waypoint190 waypoint191 waypoint192 waypoint193 waypoint194 waypoint195 waypoint196 waypoint197 waypoint198 waypoint199 waypoint200 waypoint201 waypoint202 waypoint203 waypoint204 waypoint205 waypoint206 waypoint207 waypoint208 waypoint209 waypoint210 waypoint211 waypoint212 waypoint213 waypoint214 waypoint215 waypoint216 waypoint217 waypoint218 waypoint219 waypoint220 waypoint221 waypoint222 waypoint223 waypoint224 waypoint225 waypoint226 waypoint227 waypoint228 waypoint229 waypoint230 waypoint231 waypoint232 waypoint233 waypoint234 waypoint235 waypoint236 waypoint237 waypoint238 waypoint239 waypoint240 waypoint241 waypoint242 waypoint243 waypoint244 waypoint245 waypoint246 waypoint247 waypoint248 waypoint249 waypoint250 waypoint251 waypoint252 waypoint253 wp_init_auv0 - waypoint
    data2 data3 - data
    vortex30 vortex31 vortex32 vortex33 vortex34 - vortex
    currenttide - tide
    turbine2 turbine3 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint6)
    (can-move waypoint2 waypoint3)
    (can-move waypoint3 waypoint2)
    (can-move waypoint3 waypoint27)
    (can-move waypoint27 waypoint3)
    (can-move waypoint6 waypoint25)
    (can-move waypoint25 waypoint6)
    (can-move waypoint6 waypoint10)
    (can-move waypoint10 waypoint6)
    (can-move waypoint10 waypoint29)
    (can-move waypoint29 waypoint10)
    (can-move waypoint10 waypoint30)
    (can-move waypoint30 waypoint10)
    (can-move waypoint27 waypoint28)
    (can-move waypoint28 waypoint27)
    (can-move waypoint28 waypoint29)
    (can-move waypoint29 waypoint28)

    (is-in data2 waypoint25)
    (is-in data2 waypoint26)
    (is-in data2 waypoint27)
    (is-in data2 waypoint28)
    (is-in data2 waypoint29)

    ; (is-in data3 waypoint30)
    ; (is-in data3 waypoint31)
    ; (is-in data3 waypoint32)
    ; (is-in data3 waypoint33)
    ; (is-in data3 waypoint34)

    (is-in-vortex vortex30 waypoint30)
    (is-in-vortex vortex31 waypoint31)
    (is-in-vortex vortex32 waypoint32)
    (is-in-vortex vortex33 waypoint33)
    (is-in-vortex vortex34 waypoint34)

    (is-turbine-wp waypoint25 turbine2)
    (is-turbine-wp waypoint26 turbine2)
    (is-turbine-wp waypoint27 turbine2)
    (is-turbine-wp waypoint28 turbine2)
    (is-turbine-wp waypoint29 turbine2)

    ; (is-turbine-wp waypoint30 turbine3)
    ; (is-turbine-wp waypoint31 turbine3)
    ; (is-turbine-wp waypoint32 turbine3)
    ; (is-turbine-wp waypoint33 turbine3)
    ; (is-turbine-wp waypoint34 turbine3)


    ; (cable-localized turbine2)
    ; (cable-localized turbine3)
    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)



    (tide-low currenttide)

    (= (battery-amount vehicle0) 100)

    (= (recharge-rate vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint6) 44.7653)
    (= (traverse-cost waypoint2 waypoint3) 186.041)
    (= (traverse-cost waypoint3 waypoint2) 186.041)
    (= (traverse-cost waypoint3 waypoint27) 332.376)
    (= (traverse-cost waypoint27 waypoint3) 332.376)
    (= (traverse-cost waypoint6 waypoint25) 192.236)
    (= (traverse-cost waypoint25 waypoint6) 192.236)
    (= (traverse-cost waypoint6 waypoint10) 184.911)
    (= (traverse-cost waypoint10 waypoint6) 184.911)
    (= (traverse-cost waypoint10 waypoint29) 67.2201)
    (= (traverse-cost waypoint29 waypoint10) 67.2201)
    (= (traverse-cost waypoint10 waypoint30) 58.9726)
    (= (traverse-cost waypoint30 waypoint10) 58.9726)
    (= (traverse-cost waypoint27 waypoint28) 20.4072)
    (= (traverse-cost waypoint28 waypoint27) 20.4072)
    (= (traverse-cost waypoint28 waypoint29) 13.6098)
    (= (traverse-cost waypoint29 waypoint28) 13.6098)

    (= (battery-capacity) 100)

    (= (total-missions-completed) 0)

    (= (speed vehicle0) 1000)

)
(:goal (and
    (data-sent data2)
    ; (data-sent data3)
))
(:metric maximize (total-missions-completed))

)
