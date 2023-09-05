Metacello new
	repository: 'tonel://pharo';
	baseline: 'Polaris';
	onConflict: [ :ex :pa :pb |  ex useIncoming ];
	onUpgrade: [ :ex | ex useIncoming ];
	onDowngrade: [ :ex | ex useLoaded ];
	load: #(default)
