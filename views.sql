CREATE VIEW recent_calls_by_origin AS (
    SELECT 
        TO_CHAR((timestamp 'epoch' + "datetime" * interval '1 second' / 1000),'YYYY-MM-DDThh24:MI:SS') AS "time",
        origin, 
        connectionid, 
        conferenceidentifier, 
        browsernameversionos, 
        icefailure
    FROM rtcstats
    WHERE 
        connectionid IS NOT NULL
        AND origin IS NOT NULL
    ORDER BY  datetime DESC LIMIT 1000
);


CREATE VIEW recent_failed_calls AS (
    SELECT 
        TO_CHAR((timestamp 'epoch' + "datetime" * interval '1 second' / 1000),'YYYY-MM-DDThh24:MI:SS') AS "time",
        origin,
        connectionid,
        conferenceidentifier,
        browsernameversionos,
        configuredicetransportpolicy,
        configuredwithiceservers,
        gatheredhost,
        gatheredstun,
        gatheredturnudp,
        gatheredturntcp,
        gatheredturntls,
        hadremoteturncandidate,
        relayaddress,
        locationCountry,
        publicipaddress
    FROM rtcstats
    WHERE 
        icefailure = true 
        AND iceconnectedorcompleted = false
    ORDER BY datetime DESC LIMIT 1000
);